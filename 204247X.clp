;; Computer Sound Problems Detection and Solutions

(defrule problem
   (or (start))
   =>
   (printout t crlf crlf "No sound at all?" 
               crlf "  1. Yes" 
               crlf "  2. No"
               crlf crlf "Answer (1 | 2): ")
   (assert (no-sound (read)))
)

;-----------Ask Check Physical Connection--------------------

(defrule check-physical-connections
   (no-sound 1)
   =>
   (printout t crlf crlf "Did you check physical connections?" 
                  crlf "  1. Yes" 
                  crlf "  2. No: Reconnect and check for sound."
                  crlf crlf "Answer (1 | 2): ")
   (assert (physical-connections (read)))
)

;; ;-----------Physical Connection Results---------------------

(defrule physical-connections-solved
   (physical-connections 2)
   =>
   (printout t crlf 
                  crlf "  1. Problem solved" 
                  crlf "  2. Still not solved"
                  crlf crlf "Answer (1 | 2): ")
   (assert (physical-connections-solved (read)))
)

;; ------------Check Volume Settings--------------------

(defrule volume-settings
   (or (no-sound 2)
   (physical-connections 1)
   (physical-connections-solved 2))
   =>
   (printout t crlf crlf "Volume muted or too low?" 
                  crlf "  1. Muted: Unmute and check for sound." 
                  crlf "  2. Low: Increase volume and check for sound."
                  crlf "  3. Normal"
                  crlf crlf "Answer (1 | 2 | 3): ")
   (assert (volume-settings (read)))
)

;; -------------Check for volume settings answers------------

(defrule volume-settings-solved
   (or (volume-settings 1)
   (volume-settings 2))
   =>
   (printout t crlf 
                  crlf "  1. Problem solved" 
                  crlf "  2. Still not solved"
                  crlf crlf "Answer (1 | 2): ")
   (assert (volume-settings-solved (read)))
)


;; --------------Check Audio Output Device--------------------------------

(defrule output-device
   (or (volume-settings 3)
   (volume-settings-solved 2))
   =>
   (printout t crlf crlf "Right output device selected?" 
                  crlf "  1. Yes" 
                  crlf "  2. No: Select the correct output device."
                  crlf crlf "Answer (1 | 2): ")
   (assert (output-device (read)))
)


;; --------------Check Audio Output Device Results--------------------------------


(defrule output-device-solved
   (output-device 2)
   =>
   (printout t crlf 
                  crlf "  1. Problem solved" 
                  crlf "  2. Still not solved"
                  crlf crlf "Answer (1 | 2): ")
   (assert (output-device-solved (read)))
)

;; --------------Check Device Manager (Windows) or System Preferences (Mac/Linux)

(defrule device-manager
   (or (output-device 1)
   (output-device-solved 2))
   =>
   (printout t crlf crlf "Any audio devices with issues or errors?" 
                  crlf "  1. Yes: Resolve the issues indicated." 
                  crlf "  2. No"
                  crlf crlf "Answer (1 | 2): ")
   (assert (device-manager (read)))
)

;; --------------Check Device Manager (Windows) or System Preferences (Mac/Linux) Results--------------------------------


(defrule device-manager-solved
   (device-manager 1)
   =>
   (printout t crlf 
                  crlf "  1. Problem solved" 
                  crlf "  2. Still not solved"
                  crlf crlf "Answer (1 | 2): ")
   (assert (device-manager-solved (read)))
)


;; --------------Check Sound Drivers--------------------------------


(defrule sound-driver
   (or (device-manager 2)
   (device-manager-solved 2))
   =>
   (printout t crlf crlf "Outdated or corrupted drivers?" 
                  crlf "  1. Yes: Update or reinstall audio drivers." 
                  crlf "  2. No"
                  crlf crlf "Answer (1 | 2): ")
   (assert (sound-driver (read)))
)

;; --------------Check Sound Drivers Results--------------------------------


(defrule sound-driver-solved
   (sound-driver 1)
   =>
   (printout t crlf 
                  crlf "  1. Problem solved" 
                  crlf "  2. Still not solved"
                  crlf crlf "Answer (1 | 2): ")
   (assert (sound-driver-solved (read)))
)


;; --------------Test with Different Audio Source--------------------------------


(defrule audio-source
   (or (sound-driver 2)
   (sound-driver-solved 2))
   =>
   (printout t crlf crlf "Different application or file?" 
                  crlf "  1. Yes: Test with another application or file." 
                  crlf "  2. No"
                  crlf crlf "Answer (1 | 2): ")
   (assert (audio-source (read)))
)

;; --------------Check Different Audio Source Results--------------------------------


(defrule audio-source-solved
   (audio-source 1)
   =>
   (printout t crlf 
                  crlf "  1. Problem solved" 
                  crlf "  2. Still not solved"
                  crlf crlf "Answer (1 | 2): ")
   (assert (audio-source-solved (read)))
)


;; --------------Check for Software Conflicts--------------------------------


(defrule software-conflicts
   (or (audio-source 2)
   (audio-source-solved 2))
   =>
   (printout t crlf crlf "Recent software changes or installations?" 
                  crlf "  1. Yes: Uninstall or roll back recent changes." 
                  crlf "  2. No"
                  crlf crlf "Answer (1 | 2): ")
   (assert (software-conflicts (read)))
)

;; --------------Software Conflicts Results--------------------------------


(defrule software-conflicts-solved
   (software-conflicts 1)
   =>
   (printout t crlf 
                  crlf "  1. Problem solved" 
                  crlf "  2. Still not solved"
                  crlf crlf "Answer (1 | 2): ")
   (assert (software-conflicts-solved (read)))
)


;; --------------Check for Windows Audio Service (Windows Only)--------------------------------


(defrule audio-service
   (or (software-conflicts 2)
   (software-conflicts-solved 2))
   =>
   (printout t crlf crlf "Audio service running /Windows Only/?" 
                  crlf "  1. Yes: Restart the audio service." 
                  crlf "  2. No: Start the audio service."
                  crlf "  3. Not Windows"
                  crlf crlf "Answer (1 | 2 | 3): ")
   (assert (audio-service (read)))
)


;; --------------Windows Audio Service (Windows Only) Results--------------------------------


(defrule audio-service-solved
   (or (audio-service 1)
   (audio-service 2))
   =>
   (printout t crlf 
                  crlf "  1. Problem solved" 
                  crlf "  2. Still not solved"
                  crlf crlf "Answer (1 | 2): ")
   (assert (audio-service-solved (read)))
)


;; --------------Check for Hardware Issues--------------------------------


(defrule hardware-issues
   (or (audio-service 3)
   (audio-service-solved 2))
   =>
   (printout t crlf crlf "Working with different speakers?" 
                  crlf "  1. Yes: Issue with original speakers." 
                  crlf "  2. No"
                  crlf crlf "Answer (1 | 2): ")
   (assert (hardware-issues (read)))
)


;; --------------Check for Operating System Updates--------------------------------


(defrule updates
   (hardware-issues 2)
   =>
   (printout t crlf crlf "Updates available?" 
                  crlf "  1. Yes: Install updates and restart." 
                  crlf "  2. No"
                  crlf crlf "Answer (1 | 2): ")
   (assert (updates (read)))
)



;; --------------Operating System Updates Results--------------------------------


(defrule updates-solved
   (updates 1)
   =>
   (printout t crlf 
                  crlf "  1. Problem solved" 
                  crlf "  2. Still not solved"
                  crlf crlf "Answer (1 | 2): ")
   (assert (updates-solved (read)))
)


;; --------------Check for BIOS/UEFI Updates--------------------------------


(defrule bios
   (or (updates 2)
   (updates-solved 2))
   =>
   (printout t crlf crlf "BIOS Updates available?" 
                  crlf "  1. Yes: Update BIOS/UEFI and restart." 
                  crlf "  2. No"
                  crlf crlf "Answer (1 | 2): ")
   (assert (bios (read)))
)

;; --------------BIOS/UEFI Updates Results--------------------------------


(defrule bios-solved
   (bios 1)
   =>
   (printout t crlf 
                  crlf "  1. Problem solved" 
                  crlf "  2. Still not solved"
                  crlf crlf "Answer (1 | 2): ")
   (assert (bios-solved (read)))
)


;; --------------Professional Help--------------------------------


(defrule professional-help
   (or (bios 2)
   (bios-solved 2))
   =>
   (printout t crlf crlf crlf "  - Seek professional help or check for hardware issues." crlf crlf )
)


;; -------------Solved-------------

(defrule solved
   (or (physical-connections-solved 1)
   (volume-settings-solved 1)
   (output-device-solved 1)
   (device-manager-solved 1)
   (sound-driver-solved 1)
   (audio-source-solved 1)
   (software-conflicts-solved 1)
   (audio-service-solved 1)
   (updates-solved 1)
   (bios-solved 1))
   =>
   (printout t crlf crlf crlf "  - Problem solved" crlf crlf )
)
