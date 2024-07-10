const WindowsOptions = {
  updates: [
    {
      label: "Disable Automatic Reboot",
      id: "windows-update-auto-reboot",
      tooltip:
        "Disables Windows Update from Automatically Restarting Your Computer When There's Pending Updates",
      category: "windows-updates-general",
    },
    {
      label: "Disable Automatic Updates",
      id: "windows-update-auto-updates",
      tooltip: "Prevents Windows Update From Updating The OS",
      category: "windows-updates-general",
    },
    {
      label: "Disable Delivery Optimization",
      id: "windows-update-delivery-optimization",
      tooltip:
        "Disables Delivery Optimization, Preventing The Service From Installing And Updating Updates In The Background",
      category: "windows-updates-general",
    },
    {
      label: "Disable Feature Updates",
      id: "windows-update-feature-updates",
      tooltip:
        "Disables Feature Updates, Allowing Feature Updates May Reset The Customizations You Have Set Previously",
      category: "windows-updates-general",
    },
    {
      label: "Disable Windows Insider",
      id: "windows-update-windows-insider",
      tooltip:
        "Disables Windows Insider, Removing The Telemetry & Data Collection Associated With It",
      category: "windows-updates-general",
    },
  ],
  privacy: [
    {
      label: "Disable Windows Advertising ID",
      id: "windows-privacy-advertising-id",
      tooltip: "",
      category: "windows-privacy-advertising",
    },
    {
      label: "Disable Bluetooth Advertising",
      id: "windows-privacy-bluetooth-advertising",
      tooltip: "This prevents your device from being discoverable by other Bluetooth devices in range.",
      category: "windows-privacy-advertising",
    },
    {
      label: "Disable Settings Sync",
      id: "windows-privacy-settings-sync",
      tooltip: "",
      category: "windows-privacy-cloud-service",
    },
    {
      label: "Disable Cloud Message Sync",
      id: "windows-privacy-cloud-message-sync",
      tooltip:
        "This policy setting allows backup and restore of cellular text messages to Microsoft's cloud services. Disable this feature to avoid information being stored on servers outside of your organization's control.",
      category: "windows-privacy-cloud-service",
    },
    {
      label: "Disable Second Chance Out Of Box Experience (SCOOBE)",
      id: "windows-privacy-scoobe",
      tooltip:
        "The users' initial interactions with the product immediately after upgrading the product and/or launching the product for the first time after upgrading.",
      category: "windows-privacy-cloud-service",
    },
    {
      label: "Disable Key Management System Telemetry",
      id: "windows-privacy-kms-validation",
      tooltip:
        "Stops KMS client from verifying activation online, preventing data from being sent to Microsoft even if not activated",
      category: "windows-privacy-telemetry",
    },
    {
      label: "Disable Customer Experience Improvement Program",
      id: "windows-privacy-ceip",
      tooltip: "Disables Customer Experience Improvement Program (CEIP)",
      category: "windows-privacy-telemetry",
    },
    {
      label: "Disable Diagnostic Tracing",
      id: "windows-privacy-diagnostic-tracing",
      tooltip: "Disables Diagnostic Tracing, Affecting All System Events",
      category: "windows-privacy-telemetry",
    },
    {
      label: "Disable Input Telemetry",
      id: "windows-privacy-input-telemetry",
      tooltip: "Disables Text, Ink and Handwriting Telemetry",
      category: "windows-privacy-telemetry",
    },
    {
      label: "Disable Telemetry and Data Collection",
      id: "windows-privacy-data-collection-telemetry",
      tooltip:
        "Disables Data Collection & Telemetry Defined In The OS Policies",
      category: "windows-privacy-telemetry",
    },
    {
      label: "Disable Activity Feed",
      id: "windows-privacy-activity-feed",
      tooltip: "Disables Activity Feed in Task View",
      category: "windows-privacy-telemetry",
    },
    {
      label: "Disable Most Used Application Tracking",
      id: "windows-privacy-application-launch",
      tooltip:
        "Disables Ability For Windows To Track Which Apps You Track Frequently",
      category: "windows-privacy-telemetry",
    },
    {
      label: "Disable Experimentation",
      id: "windows-privacy-experimentation",
      tooltip:
        "Disables The Ability for Microsoft to Use Your Computer as a Test for Certain Features",
      category: "windows-privacy-telemetry",
    },
    {
      label: "Disable Find My Device",
      id: "windows-privacy-find-my-device",
      tooltip: "Disables The Find My Device Feature (Location Tracking)",
      category: "windows-privacy-telemetry",
    },
    {
      label: "Disable LockScreen Camera",
      id: "windows-privacy-lockscreen-camera",
      tooltip:
        "Disables The Ability For The OS to Access Your Camera At The LockScreen",
      category: "windows-privacy-peripherals",
    },
    {
      label: "Disable Online Speech Recognition",
      id: "windows-privacy-speech-recognition",
      tooltip: "Disables The Ability For The OS To Use Speech Recognition",
      category: "windows-privacy-cloud-service",
    },
    {
      label: "Disable Performance Tracking",
      id: "windows-privacy-performance-tracking",
      tooltip:
        "Disables Perf Tracking, Responsiveness Events Are Not Processed.",
      category: "windows-privacy-telemetry",
    },
    {
      label: "Disable Malicious Software Removal Tool Telemetry",
      id: "windows-privacy-msrt-telemetry",
      tooltip: "Disable Malicious Software Removal Tool Telemetry",
      category: "windows-privacy-telemetry",
    },
    {
      label: "Disable PowerShell Core Telemetry",
      id: "windows-privacy-pwsh-core",
      tooltip: "Disable PowerShell Core Installations Telemetry",
      category: "windows-privacy-telemetry",
    },
  ],
};
