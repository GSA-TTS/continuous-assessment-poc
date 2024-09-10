---
x-trestle-add-props: []
  # Add or modify control properties here
  # Properties may be at the control or part level
  # Add control level properties like this:
  #   - name: ac1_new_prop
  #     value: new property value
  #
  # Add properties to a statement part like this, where "b." is the label of the target statement part
  #   - name: ac1_new_prop
  #     value: new property value
  #     smt-part: b.
  #
x-trestle-comp-def-rules:
  Cloud.gov:
    - name: app-alert-sla
      description: Application owners must establish an SLA with cloud.gov for reporting
        malicious code detection
x-trestle-set-params:
  # You may set values for parameters in the assembled SSP by adding
  #
  # ssp-values:
  #   - value 1
  #   - value 2
  #
  # below a section of values:
  # The values list refers to the values in the resolved profile catalog, and the ssp-values represent new values
  # to be placed in SetParameters of the SSP.
  #
  si-04.05_odp.01:
    guidelines:
      - prose: personnel or roles to be alerted when indications of compromise or
          potential compromise occur is/are defined;
    values:
      - all staff with system administration, monitoring, and/or security responsibilities
        including but not limited to ISSM, ISSO, System Program Managers, Sys/Net/App
        Admins, etc.
    alt-identifier: si-4.5_prm_1
  si-04.05_odp.02:
    guidelines:
      - prose: compromise indicators are defined;
    values:
      - 'compromise indicators may include but shall not be limited to the following:
        - Protected system files or directories have been modified without notification
        from the appropriate change/configuration management channels. - System performance
        indicates resource consumption that is inconsistent with expected operating
        conditions. - Auditing functionality has been disabled or modified to reduce
        audit visibility. - Audit or log records have been deleted or modified without
        explanation. - The system is raising alerts or faults in a manner that indicates
        the presence of an abnormal condition. - Resource or service requests are
        initiated from clients that are outside of the expected client membership
        set. - The system reports failed logins or password changes for administrative
        or key service accounts. - Processes and services are running that are outside
        of the baseline system profile. - Utilities, tools, or scripts have been saved
        or installed on production systems without clear indication of their use or
        purpose'
    alt-identifier: si-4.5_prm_2
x-trestle-global:
  profile:
    title: 'Lightweight Security Authorization Process: System Security and Privacy
      Plan'
    href: trestle://profiles/lato/profile.json
  sort-id: si-04.05
---

# si-4.5 - \[System and Information Integrity\] System-generated Alerts

## Control Statement

Alert [all staff with system administration, monitoring, and/or security responsibilities including but not limited to ISSM, ISSO, System Program Managers, Sys/Net/App Admins, etc.] when the following system-generated indications of compromise or potential compromise occur: [compromise indicators may include but shall not be limited to the following: - Protected system files or directories have been modified without notification from the appropriate change/configuration management channels. - System performance indicates resource consumption that is inconsistent with expected operating conditions. - Auditing functionality has been disabled or modified to reduce audit visibility. - Audit or log records have been deleted or modified without explanation. - The system is raising alerts or faults in a manner that indicates the presence of an abnormal condition. - Resource or service requests are initiated from clients that are outside of the expected client membership set. - The system reports failed logins or password changes for administrative or key service accounts. - Processes and services are running that are outside of the baseline system profile. - Utilities, tools, or scripts have been saved or installed on production systems without clear indication of their use or purpose].

## Control Assessment Objective

[all staff with system administration, monitoring, and/or security responsibilities including but not limited to ISSM, ISSO, System Program Managers, Sys/Net/App Admins, etc.] are alerted when system-generated [compromise indicators may include but shall not be limited to the following: - Protected system files or directories have been modified without notification from the appropriate change/configuration management channels. - System performance indicates resource consumption that is inconsistent with expected operating conditions. - Auditing functionality has been disabled or modified to reduce audit visibility. - Audit or log records have been deleted or modified without explanation. - The system is raising alerts or faults in a manner that indicates the presence of an abnormal condition. - Resource or service requests are initiated from clients that are outside of the expected client membership set. - The system reports failed logins or password changes for administrative or key service accounts. - Processes and services are running that are outside of the baseline system profile. - Utilities, tools, or scripts have been saved or installed on production systems without clear indication of their use or purpose] occur.

## Control guidance

Alerts may be generated from a variety of sources, including audit records or inputs from malicious code protection mechanisms, intrusion detection or prevention mechanisms, or boundary protection devices such as firewalls, gateways, and routers. Alerts can be automated and may be transmitted telephonically, by electronic mail messages, or by text messaging. Organizational personnel on the alert notification list can include system administrators, mission or business owners, system owners, information owners/stewards, senior agency information security officers, senior agency officials for privacy, system security officers, or privacy officers. In contrast to alerts generated by the system, alerts generated by organizations in [SI-4(12)](#si-4.12) focus on information sources external to the system, such as suspicious activity reports and reports on potential insider threats.

______________________________________________________________________

## What is the solution and how is it implemented?

<!-- For implementation status enter one of: implemented, partial, planned, alternative, not-applicable -->

<!-- Note that the list of rules under ### Rules: is read-only and changes will not be captured after assembly to JSON -->

### This System

<!-- Add implementation prose for the main This System component for control: si-4.5 -->

#### Implementation Status: planned

### Cloud.gov

Application owners must establish the SLA with cloud.gov for reporting malicious code detection that effects the application. cloud.gov will detect files matching AV/Malware signatures in customer application deployments, or uploads, but alerts can only be routed to customers during business hours.

#### Rules:

  - app-alert-sla

#### Implementation Status: partial

______________________________________________________________________
