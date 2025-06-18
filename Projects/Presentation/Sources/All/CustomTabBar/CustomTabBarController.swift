//
//  CustomTabBarController.swift
//  Presentation
//
//  Created by 상은 on 6/18/25.
//

import UIKit
import Shared

final class CustomTabBar: UITabBar {
    
    private let bottomPadding: CGFloat = 10
    // 탭바 위쪽 버튼 위치 띄우기용 패딩
    private let topPadding: CGFloat = 10
    
    private let shadowLayer = CALayer()

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var newSize = super.sizeThatFits(size)
        // 탭바 높이 + 위아래 패딩 추가
        newSize.height += topPadding + bottomPadding
        return newSize
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 탭바 버튼 위치 위로 올리기
        for subview in subviews {
            if NSStringFromClass(type(of: subview)).contains("UITabBarButton") {
                subview.frame.origin.y = subview.frame.origin.y - topPadding
            }
        }
        
        // 그림자 레이어 설정 (한 번만 추가)
        shadowLayer.frame = bounds
        if shadowLayer.superlayer == nil {
            layer.insertSublayer(shadowLayer, at: 0)
            shadowLayer.backgroundColor = UIColor.additionalBackground?.cgColor ?? UIColor.white.cgColor
            shadowLayer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 0).cgPath
            shadowLayer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
            shadowLayer.shadowOpacity = 1
            shadowLayer.shadowRadius = 60
            shadowLayer.shadowOffset = CGSize(width: 0, height: -20)
        }
    }
}

final class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {

    private var lastSelectedIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // 커스텀 탭바 사용
        setValue(CustomTabBar(), forKey: "tabBar")
        delegate = self
        setupViewControllers()
        configureTabBarAppearance()
    }

    private func setupViewControllers() {
        let firstVC = LoginViewController(viewModel: LoginViewModel())
        firstVC.tabBarItem = UITabBarItem(title: "로그인", image: UIImage(systemName: "person"), tag: 0)

        let secondVC = RegisterViewController(viewModel: RegisterViewModel())
        secondVC.tabBarItem = UITabBarItem(title: "회원가입", image: UIImage(systemName: "pencil"), tag: 1)

        let thirdVC = EnterOTPViewController(email: "test@example.com")
        thirdVC.tabBarItem = UITabBarItem(title: "OTP", image: UIImage(systemName: "lock.shield"), tag: 2)

        viewControllers = [firstVC, secondVC, thirdVC]
    }

    private func configureTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .additionalBackground
        
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .font: Typography.tabBarLabel.font,
            .foregroundColor: UIColor.primary!
        ]
        
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .font: Typography.tabBarLabel.font,
            .foregroundColor: UIColor.gray70!
        ]
        
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
        
        tabBar.tintColor = .primary
        tabBar.unselectedItemTintColor = .gray70
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let viewControllers = viewControllers,
              let index = tabBar.items?.firstIndex(of: item),
              index != selectedIndex else { return }

        let direction: CGFloat = index > lastSelectedIndex ? 1 : -1
        animateTabTransition(to: viewControllers[index], direction: direction)
        bounceTabIcon(at: index)
        lastSelectedIndex = index
    }

    private func animateTabTransition(to newVC: UIViewController, direction: CGFloat) {
        guard let fromView = selectedViewController?.view,
              let toView = newVC.view else { return }

        view.addSubview(toView)
        toView.frame = fromView.frame.offsetBy(dx: direction * fromView.frame.width, dy: 0)

        UIView.animate(withDuration: 0.3, animations: {
            fromView.frame = fromView.frame.offsetBy(dx: -direction * fromView.frame.width, dy: 0)
            toView.frame = toView.frame.offsetBy(dx: -direction * fromView.frame.width, dy: 0)
        }, completion: { _ in
            fromView.removeFromSuperview()
            self.selectedViewController = newVC
        })
    }

    private func bounceTabIcon(at index: Int) {
        let tabBarSubviews = tabBar.subviews.filter { $0 is UIControl }
        guard index < tabBarSubviews.count else { return }

        let tabBarButton = tabBarSubviews[index]

        let bounce = CAKeyframeAnimation(keyPath: "transform.scale")
        bounce.values = [1.2, 1.0]
        bounce.duration = 0.15
        bounce.calculationMode = .linear

        tabBarButton.layer.add(bounce, forKey: nil)
    }
}

#Preview{
    Pretendard.registerFont()
    return CustomTabBarController()
}
