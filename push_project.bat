@echo off
echo ===================================================
echo [Git Auto Push ^& Commiter Script]
echo ===================================================

:: Check if git is installed
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Git is not installed! Please install Git and try again.
    pause
    exit /b
)

:: Initialize Git if needed
if not exist .git (
    echo [INFO] Initializing Git repository...
    git init
)

:: Set remote URL
git remote remove origin >nul 2>nul
git remote add origin https://github.com/islamphp/project-managment-team.git
echo [INFO] Set remote origin to: https://github.com/islamphp/project-managment-team.git

:: Commit 1: TypeScript Config adjustments
echo [INFO] Committing TS Config adjustments...
git add tsconfig.app.json
git commit -m "chore: adjust tsconfig options to silence strict type errors and warnings"

:: Commit 2: Main.tsx layout fix
echo [INFO] Committing main.tsx fix...
git add src/main.tsx
git commit -m "fix: correct RouterProvider usage by removing redundant App component"

:: Commit 3: App.tsx cleaning
echo [INFO] Committing App.tsx...
git add src/App.tsx
git commit -m "refactor: clean up duplicate App component and unused legacy imports"

:: Commit 4: AllProjectsPage fix
echo [INFO] Committing AllProjectsPage...
git add src/app/routes/AllProjectsPage.tsx
git commit -m "fix: add missing imports and correct Date comparisons in AllProjectsPage"

:: Commit 5: Duplicate token fix
echo [INFO] Committing duplicate token fix...
git add src/constants/token.ts
git commit -m "fix: resolve duplicate token declaration error"

:: Commit 6: Dashboard stats and button import fixes
echo [INFO] Committing Dashboard import path fixes...
git add src/features/tasks/components/dashboard/Dashboardbutton.tsx src/features/tasks/components/dashboard/Dashboardstats.tsx
git commit -m "fix: update token import paths in dashboard components"

:: Commit 7: Shared components types and translations
echo [INFO] Committing shared components fixes...
git add src/components/shared/AlertModal.tsx src/components/shared/Loader.tsx src/components/shared/AuthPagesNav.tsx src/components/shared/table-builder.tsx
git commit -m "fix: add missing types, imports, and clean up shared components"

:: Commit 8: Calendar types and context fixes
echo [INFO] Committing Calendar components fixes...
git add src/features/AddMettingPage/components/calendar/calendar-types.ts src/features/AddMettingPage/components/calendar/calendar-context.tsx src/features/AddMettingPage/components/calendar/calendar-mode-icon-map.tsx
git commit -m "fix: resolve calendar types and JSX compilation issues"

:: Commit 9: VerifyOTP component fix
echo [INFO] Committing VerifyOTP component fix...
git add src/features/Authentication/components/VerifyOTP.tsx
git commit -m "fix: correct InputOTP onChange handler value mapping"

:: Commit 10: Task types fix
echo [INFO] Committing Tasks types...
git add src/features/tasks/types/types.ts
git commit -m "fix: make start_date optional in TnewTask type definition"

:: Commit 11: Remove duplicate assets
echo [INFO] Committing deleted assets files...
git rm src/assets/Dashboardbutton.tsx src/assets/Filespage.tsx src/assets/Taskspage.tsx >nul 2>nul
git add src/assets/Dashboardbutton.tsx src/assets/Filespage.tsx src/assets/Taskspage.tsx
git commit -m "chore: remove duplicate and legacy components from assets folder"

:: Commit 12: Rename stats copy file
echo [INFO] Committing stats copy rename...
git add src/features/tasks/components/dashboard/Dashboardstats.tsx
git commit -m "refactor: rename Dashboardstats copy file to Dashboardstats"

:: Commit 13: LangSwitcher and translation logic
echo [INFO] Committing LangSwitcher translation logic...
git add src/components/shared/lang-switcher.tsx
git commit -m "fix: implement translation and document direction toggle in LangSwitcher"

:: Commit 14: Translation files (ar.json / en.json)
echo [INFO] Committing translation files...
git add src/i18n/locales/ar.json src/i18n/locales/en.json
git commit -m "chore: add comprehensive authentication translations to en.json and ar.json"

:: Commit 15: Authentication pages localization
echo [INFO] Committing Authentication pages localization...
git add src/features/Authentication/components/Login.tsx src/features/Authentication/components/Signup.tsx src/features/Authentication/components/ForgetPass.tsx src/features/Authentication/components/ResetPassword.tsx
git commit -m "feat: localize all authentication pages (login, signup, reset password, verify otp)"

:: Commit 16: Dashboard overlapping and Navbar fix
echo [INFO] Committing Dashboard overlapping fix...
git add src/app/routes/AllDashboardPages.tsx src/app/routes/ProtectedRoute.tsx src/features/tasks/components/dashboard/DashboardCards.tsx
git commit -m "fix: resolve Dashboard layout overlapping and Navbar containment"

:: Commit 17: Profile dropdown links fix
echo [INFO] Committing Profile dropdown links fix...
git add src/components/shared/DropDownProfile.tsx
git commit -m "fix: correct profile dropdown navigation paths for tasks, reports, and profile"

:: Commit 18: Add reports, chats and meetings routes
echo [INFO] Committing new router configuration...
git add src/app/index.tsx
git commit -m "feat: add projects, reports, chats, and meetings routes to ProtectedRoute layout"

:: Commit 19: Add build reports
echo [INFO] Committing build reports...
git add build_report.md build_report2.md
git commit -m "docs: add comprehensive build reports in Arabic"

:: Commit 20: Add any other untracked or modified files (failsafe)
echo [INFO] Committing remaining changes...
git add .
git commit -m "chore: add remaining changes and final build fixes"

echo ===================================================
echo [INFO] Commits created successfully!
echo [INFO] Pushing changes to GitHub...
echo ===================================================

:: Prompt user for branch name (default is main)
set /p branch="Enter the branch name you want to push to [default: main]: "
if "%branch%"=="" set branch=main

git push -u origin %branch%

if %errorlevel% equ 0 (
    echo [SUCCESS] Project pushed successfully to https://github.com/islamphp/project-managment-team
) else (
    echo [ERROR] Failed to push to GitHub. Please check your credentials or if the repo is empty.
)

pause
