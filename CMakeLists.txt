cmake_minimum_required(VERSION 3.16)
project(SmartThermostatUIExample VERSION 1.0 LANGUAGES C CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(QT NAMES Qt5 Qt6 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Gui Quick)

qt_standard_project_setup()

qt_add_executable(SmartThermostatUIExample WIN32 MACOSX_BUNDLE
    Controllers/systemcontroller.cpp Controllers/systemcontroller.h
    main.cpp
)
target_link_libraries(SmartThermostatUIExample PRIVATE
    Qt::Core
    Qt::Gui
    Qt::Quick
)


# Resources:
set(qml_resource_files
    "UI/Assets/auto.png"
    "UI/Assets/calendar.png"
    "UI/Assets/flame.png"
    "UI/Assets/ice-crystal.png"
    "UI/Assets/info-button.png"
    "UI/Assets/previous.png"
    "UI/Assets/settings.png"
    "UI/Assets/thermometer.png"
    "UI/Assets/wifi.png"
    "UI/HomeScreen/HeatSelectDialog.qml"
    "UI/HomeScreen/HomeScreen.qml"
    "UI/HomeScreen/TemperatureControlSlider.qml"
    "UI/SettingsScreen/SettingsMainMenu.qml"
    "UI/SettingsScreen/SettingsScreen.qml"
    "main.qml"
)

qt_add_resources(SmartThermostatUIExample "qml"
    PREFIX
        "/"
    FILES
        ${qml_resource_files}
)

install(TARGETS SmartThermostatUIExample
    BUNDLE DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

qt_generate_deploy_app_script(
    TARGET SmartThermostatUIExample
    FILENAME_VARIABLE deploy_script
    NO_UNSUPPORTED_PLATFORM_ERROR
)
install(SCRIPT ${deploy_script})
