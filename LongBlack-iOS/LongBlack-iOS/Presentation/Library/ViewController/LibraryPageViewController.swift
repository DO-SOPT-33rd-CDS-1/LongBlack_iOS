//
//  LibraryPageViewController.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/27/23.
//

import UIKit

import Then
import SnapKit

class LibraryPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    lazy var orderedViewControllers: [BaseViewController] = {
        return [
            LibraryViewController(),
            MyBookmarkView(),
            MyStickerView(),
            MyNoteView()
        ]
    }()
    
    private var libraryButtonLine = UIView()
    
    var currentIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        self.dataSource = self

        if let firstViewController = orderedViewControllers.first,
           let libraryViewController = firstViewController as? LibraryViewController {
            setViewControllers([libraryViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        setupLibrarySectionButtons()
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        libraryButtonLine.do {
            $0.backgroundColor = .red
        }
    }
    
    private func setLayout() {
        self.view.addSubviews(libraryButtonLine)
        
        libraryButtonLine.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview().inset(139)
        }
    }
    
    func setupLibrarySectionButtons() {
            let buttonTitles = ["스탬프", "내노트", "스티커", "북마크"]
            let buttonWidth = view.bounds.width / CGFloat(buttonTitles.count)

            for (index, title) in buttonTitles.enumerated() {
                let button = UIButton(type: .system)
                button.frame = CGRect(x: CGFloat(index) * buttonWidth, y: 111, width: buttonWidth, height: 33)
                button.setTitle(title, for: .normal)
                button.setTitleColor(.subGray1, for: .normal)
                button.titleLabel?.font = .b3Medium
                button.tag = index
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                view.addSubview(button)
            }
        }

    @objc func buttonTapped(_ sender: UIButton) {
        let direction: UIPageViewController.NavigationDirection = sender.tag > currentIndex ? .forward : .reverse
        let targetIndex = sender.tag
        let targetViewController = orderedViewControllers[targetIndex]
        
        setViewControllers([targetViewController], direction: direction, animated: true, completion: nil)
        currentIndex = targetIndex
    }
    

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController as! BaseViewController) else {
            return nil
        }

        let previousIndex = viewControllerIndex - 1

        guard previousIndex >= 0 else {
            return orderedViewControllers.last
        }

        guard orderedViewControllers.count > previousIndex else {
            return nil
        }

        return orderedViewControllers[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController as! BaseViewController) else {
            return nil
        }

        let nextIndex = viewControllerIndex + 1

        guard nextIndex < orderedViewControllers.count else {
            return orderedViewControllers.first
        }

        guard orderedViewControllers.count > nextIndex else {
            return nil
        }

        return orderedViewControllers[nextIndex]
    }

}
