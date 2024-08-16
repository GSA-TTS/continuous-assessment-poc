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
  GitHub Actions:
    - name: properly-configured
      description: System Owner has configured the system to properly utilize CI/CD
        for all tests, scans, and deployments
    - name: branch-protections
      description: System Owner has configured GitHub branch protections as described
        in control
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
  si-02_odp:
    guidelines:
      - prose: time period within which to install security-relevant software updates
          after the release of the updates is defined;
    values:
      - the timeframe(s) outlined within the system’s system security plan and as
        required by CIO 2100.1 and CIO-IT Security-06-30, Managing Enterprise Cybersecurity
        Risk
    alt-identifier: si-2_prm_1
x-trestle-global:
  profile:
    title: 'Lightweight Security Authorization Process: System Security and Privacy
      Plan'
    href: trestle://profiles/lato/profile.json
  sort-id: si-02
---

# si-2 - \[\] Flaw Remediation

## Control Statement

- \[a.\] Identify, report, and correct system flaws;

- \[b.\] Test software and firmware updates related to flaw remediation for effectiveness and potential side effects before installation;

- \[c.\] Install security-relevant software and firmware updates within [the timeframe(s) outlined within the system’s system security plan and as required by CIO 2100.1 and CIO-IT Security-06-30, Managing Enterprise Cybersecurity Risk] of the release of the updates; and

- \[d.\] Incorporate flaw remediation into the organizational configuration management process.

## Control Assessment Objective

- \[SI-02a.\]

  - \[SI-02a.[01]\] system flaws are identified;
  - \[SI-02a.[02]\] system flaws are reported;
  - \[SI-02a.[03]\] system flaws are corrected;

- \[SI-02b.\]

  - \[SI-02b.[01]\] software updates related to flaw remediation are tested for effectiveness before installation;
  - \[SI-02b.[02]\] software updates related to flaw remediation are tested for potential side effects before installation;
  - \[SI-02b.[03]\] firmware updates related to flaw remediation are tested for effectiveness before installation;
  - \[SI-02b.[04]\] firmware updates related to flaw remediation are tested for potential side effects before installation;

- \[SI-02c.\]

  - \[SI-02c.[01]\] security-relevant software updates are installed within [the timeframe(s) outlined within the system’s system security plan and as required by CIO 2100.1 and CIO-IT Security-06-30, Managing Enterprise Cybersecurity Risk] of the release of the updates;
  - \[SI-02c.[02]\] security-relevant firmware updates are installed within [the timeframe(s) outlined within the system’s system security plan and as required by CIO 2100.1 and CIO-IT Security-06-30, Managing Enterprise Cybersecurity Risk] of the release of the updates;

- \[SI-02d.\] flaw remediation is incorporated into the organizational configuration management process.

## Control guidance

The need to remediate system flaws applies to all types of software and firmware. Organizations identify systems affected by software flaws, including potential vulnerabilities resulting from those flaws, and report this information to designated organizational personnel with information security and privacy responsibilities. Security-relevant updates include patches, service packs, and malicious code signatures. Organizations also address flaws discovered during assessments, continuous monitoring, incident response activities, and system error handling. By incorporating flaw remediation into configuration management processes, required remediation actions can be tracked and verified.

Organization-defined time periods for updating security-relevant software and firmware may vary based on a variety of risk factors, including the security category of the system, the criticality of the update (i.e., severity of the vulnerability related to the discovered flaw), the organizational risk tolerance, the mission supported by the system, or the threat environment. Some types of flaw remediation may require more testing than other types. Organizations determine the type of testing needed for the specific type of flaw remediation activity under consideration and the types of changes that are to be configuration-managed. In some situations, organizations may determine that the testing of software or firmware updates is not necessary or practical, such as when implementing simple malicious code signature updates. In testing decisions, organizations consider whether security-relevant software or firmware updates are obtained from authorized sources with appropriate digital signatures.

______________________________________________________________________

## What is the solution and how is it implemented?

<!-- For implementation status enter one of: implemented, partial, planned, alternative, not-applicable -->

<!-- Note that the list of rules under ### Rules: is read-only and changes will not be captured after assembly to JSON -->

### This System

<!-- Add implementation prose for the main This System component for control: si-2 -->

#### Implementation Status: planned

______________________________________________________________________

## Implementation for part a.

### GitHub Actions

Flaw and vulnerability checks are built into the continuous_monitoring CI/CD pipeline and automated to ensure compliance. Dynamic vulnerability scans are performed against continuous_monitoring before a successful deployment and reports issues after every scan.

Compliance is documented in sections SA-11 and RA-5. The continuous_monitoring DevOps team uses GitHub as the Product Backlog to track and prioritize issues related to system flaws.

The responsibility of remediating flaws and vulnerabilities (once a remediation is available) falls on the continuous_monitoring Developer, who updates the continuous_monitoring code and deploys fixes as part of the normal development and CI/CD process.

#### Rules:

  - properly-configured
  - branch-protections

#### Implementation Status: implemented

______________________________________________________________________

## Implementation for part b.

### GitHub Actions

Any flaws or vulnerabilities resolved in continuous_monitoring result in a GitHub issue for triage via the continuous_monitoring CM Configuration Control process described in CM-2(2). After resolving a vulnerability or flaw in continuous_monitoring, unit tests and integration tests are updated to prevent further inclusion of similar flaws.

* All GitHub tickets have accompanying Acceptance Criteria that are used to create unit tests.
* Unit tests are run on the Development environment when new code is pushed.
* Integration tests are run on the Test environment when the remediation is deployed via the CI/CD process to ensure that the production environment does not suffer from any side effects of the vulnerability remediation.
* Integration tests are run on the Prod environment when the remediation is deployed via the CI/CD process to validate the remediation and application functionality.
* All findings that are not remediated immediately are tracked in the #{app_name} Plan of Action and Milestones (POAM) by continuous_monitoring Operations and the continuous_monitoring ISSO.

#### Rules:

  - properly-configured

#### Implementation Status: implemented

______________________________________________________________________
