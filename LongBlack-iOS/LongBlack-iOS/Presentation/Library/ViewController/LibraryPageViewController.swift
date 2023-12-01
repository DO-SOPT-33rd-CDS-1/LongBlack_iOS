//
//  LibraryPageViewController.swift
//  LongBlack-iOS
//
//  Created by 방민지 on 11/27/23.
//

import UIKit

import SnapKit
import Then

final class LibraryPageViewController: UIViewController {
    

    let customLibraryView = CustomLibraryNavigationView()
    private let segmentedControl = LibrarySegmentedControl(items: [StringLiterals.Library.Page.stampPage, StringLiterals.Library.Page.myNotePage, StringLiterals.Library.Page.stickerPage, StringLiterals.Library.Page.bookmarkPage])
    private lazy var pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    let libraryViewController = LibraryViewController()
    let myNoteView = MyNoteView()
    let myStickerView = MyStickerView()
    let myBookmarkView = MyBookmarkView()

    var orderedViewControllers: [UIViewController] {
        [self.libraryViewController, self.myNoteView, self.myStickerView, self.myBookmarkView]
    }
    
    var currentPage: Int = 0 {
      didSet {
        let direction: UIPageViewController.NavigationDirection = oldValue <= self.currentPage ? .forward : .reverse
        self.pageViewController.setViewControllers(
          [orderedViewControllers[self.currentPage]],
          direction: direction,
          animated: true,
          completion: nil
        )
      }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setDelegate()
        setSegmentedControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
}

// MARK: - extension
extension LibraryPageViewController {
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        pageViewController.do {
            $0.setViewControllers([self.orderedViewControllers[0]], direction: .forward, animated: true)
        }
    }
    
    private func setLayout() {
        self.navigationController?.navigationBar.isHidden = true
        
        view.addSubviews(
            customLibraryView,
            segmentedControl,
            pageViewController.view
        )
        
        customLibraryView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets).offset(60)
            $0.horizontalEdges.equalToSuperview()
        }
        
        segmentedControl.snp.makeConstraints {
            $0.height.equalTo(33)
            $0.width.equalToSuperview()
            $0.top.equalTo(customLibraryView.snp.bottom)
        }
        
        pageViewController.view.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom)
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    
    private func setDelegate() {
        pageViewController.delegate = self
        pageViewController.dataSource = self
    }

    private func setSegmentedControl() {
        self.segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.subGray3,
            .font: UIFont.b3Medium], for: .normal)
        self.segmentedControl.setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: UIColor.subGray1,
             .font: UIFont.b3Medium], for: .selected)
        self.segmentedControl.addTarget(self, action: #selector(changeValue(control:)), for: .valueChanged)
        self.segmentedControl.selectedSegmentIndex = 0
        self.changeValue(control: self.segmentedControl)
    }
    
    @objc private func changeValue(control: UISegmentedControl) {
        self.currentPage = control.selectedSegmentIndex
    }
}

// MARK: UIPageViewControllerDelegate
extension LibraryPageViewController: UIPageViewControllerDelegate { }

// MARK: UIPageViewControllerDataSource
extension LibraryPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        guard let index = self.orderedViewControllers.firstIndex(of: viewController),
            index - 1 >= 0
        else { return nil }
        return self.orderedViewControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = self.orderedViewControllers.firstIndex(of: viewController),
            index + 1 < self.orderedViewControllers.count
        else { return nil }
        return self.orderedViewControllers[index + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let viewController = pageViewController.viewControllers?[0],
            let index = self.orderedViewControllers.firstIndex(of: viewController)
        else { return }
        self.currentPage = index
        self.segmentedControl.selectedSegmentIndex = index
    }
}
