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
    - name: app-monitoring-scanning-required
      description: Application scanning and monitoring are the system responsibility
  GitHub Actions:
    - name: properly-configured
      description: System Owner has configured the system to properly utilize CI/CD
        for all tests, scans, and deployments
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
  ca-7_prm_4:
    aggregates:
      - ca-07_odp.04
      - ca-07_odp.06
  ca-7_prm_5:
    aggregates:
      - ca-07_odp.05
      - ca-07_odp.07
  ca-07_odp.01:
    guidelines:
      - prose: system-level metrics to be monitored are defined;
    values:
      - as specified in Section 3 of CIO-IT Security-08-39, Management Implementation
        Plan and CIO-IT Security-12-66, ISCM Strategy and OA Program
    alt-identifier: ca-7_prm_1
  ca-07_odp.02:
    guidelines:
      - prose: frequencies at which to monitor control effectiveness are defined;
    values:
      - as specified in Section 3 of CIO-IT Security-08-39, Management Implementation
        Plan and CIO-IT Security-12-66, ISCM Strategy and OA Program
    alt-identifier: ca-7_prm_2
  ca-07_odp.03:
    guidelines:
      - prose: frequencies at which to assess control effectiveness are defined;
    values:
      - as specified in Section 3 of CIO-IT Security-08-39, Management Implementation
        Plan and CIO-IT Security-12-66, ISCM Strategy and OA Program
    alt-identifier: ca-7_prm_3
  ca-07_odp.04:
    guidelines:
      - prose: personnel or roles to whom the security status of the system is reported
          are defined;
    values:
      - CISO, AOs, System Owners, ISSMs, ISSOs, Custodians
  ca-07_odp.05:
    guidelines:
      - prose: frequency at which the security status of the system is reported is
          defined;
    values:
      - as specified in Section 3 of CIO-IT Security-08-39, Management Implementation
        Plan and CIO-IT Security-12-66, ISCM Strategy and OA Program
  ca-07_odp.06:
    guidelines:
      - prose: personnel or roles to whom the privacy status of the system is reported
          are defined;
    values:
      - CISO, AOs, System Owners, ISSMs, ISSOs, Custodians
  ca-07_odp.07:
    guidelines:
      - prose: frequency at which the privacy status of the system is reported is
          defined;
    values:
      - as specified in Section 3 of CIO-IT Security-08-39, Management Implementation
        Plan and CIO-IT Security-12-66, ISCM Strategy and OA Program
x-trestle-global:
  profile:
    title: 'Lightweight Security Authorization Process: System Security and Privacy
      Plan'
    href: trestle://profiles/lato/profile.json
  sort-id: ca-07
---

# ca-7 - \[Assessment, Authorization, and Monitoring\] Continuous Monitoring

## Control Statement

Develop a system-level continuous monitoring strategy and implement continuous monitoring in accordance with the organization-level continuous monitoring strategy that includes:

- \[a.\] Establishing the following system-level metrics to be monitored: [as specified in Section 3 of CIO-IT Security-08-39, Management Implementation Plan and CIO-IT Security-12-66, ISCM Strategy and OA Program];

- \[b.\] Establishing [as specified in Section 3 of CIO-IT Security-08-39, Management Implementation Plan and CIO-IT Security-12-66, ISCM Strategy and OA Program] for monitoring and [as specified in Section 3 of CIO-IT Security-08-39, Management Implementation Plan and CIO-IT Security-12-66, ISCM Strategy and OA Program] for assessment of control effectiveness;

- \[c.\] Ongoing control assessments in accordance with the continuous monitoring strategy;

- \[d.\] Ongoing monitoring of system and organization-defined metrics in accordance with the continuous monitoring strategy;

- \[e.\] Correlation and analysis of information generated by control assessments and monitoring;

- \[f.\] Response actions to address results of the analysis of control assessment and monitoring information; and

- \[g.\] Reporting the security and privacy status of the system to [CISO, AOs, System Owners, ISSMs, ISSOs, Custodians, CISO, AOs, System Owners, ISSMs, ISSOs, Custodians] [as specified in Section 3 of CIO-IT Security-08-39, Management Implementation Plan and CIO-IT Security-12-66, ISCM Strategy and OA Program, as specified in Section 3 of CIO-IT Security-08-39, Management Implementation Plan and CIO-IT Security-12-66, ISCM Strategy and OA Program].

## Control Assessment Objective

- \[CA-07[01]\] a system-level continuous monitoring strategy is developed;

- \[CA-07[02]\] system-level continuous monitoring is implemented in accordance with the organization-level continuous monitoring strategy;

- \[CA-07a.\] system-level continuous monitoring includes establishment of the following system-level metrics to be monitored: [as specified in Section 3 of CIO-IT Security-08-39, Management Implementation Plan and CIO-IT Security-12-66, ISCM Strategy and OA Program];

- \[CA-07b.\]

  - \[CA-07b.[01]\] system-level continuous monitoring includes established [as specified in Section 3 of CIO-IT Security-08-39, Management Implementation Plan and CIO-IT Security-12-66, ISCM Strategy and OA Program] for monitoring;
  - \[CA-07b.[02]\] system-level continuous monitoring includes established [as specified in Section 3 of CIO-IT Security-08-39, Management Implementation Plan and CIO-IT Security-12-66, ISCM Strategy and OA Program] for assessment of control effectiveness;

- \[CA-07c.\] system-level continuous monitoring includes ongoing control assessments in accordance with the continuous monitoring strategy;

- \[CA-07d.\] system-level continuous monitoring includes ongoing monitoring of system and organization-defined metrics in accordance with the continuous monitoring strategy;

- \[CA-07e.\] system-level continuous monitoring includes correlation and analysis of information generated by control assessments and monitoring;

- \[CA-07f.\] system-level continuous monitoring includes response actions to address the results of the analysis of control assessment and monitoring information;

- \[CA-07g.\]

  - \[CA-07g.[01]\] system-level continuous monitoring includes reporting the security status of the system to [CISO, AOs, System Owners, ISSMs, ISSOs, Custodians] [as specified in Section 3 of CIO-IT Security-08-39, Management Implementation Plan and CIO-IT Security-12-66, ISCM Strategy and OA Program];
  - \[CA-07g.[02]\] system-level continuous monitoring includes reporting the privacy status of the system to [CISO, AOs, System Owners, ISSMs, ISSOs, Custodians] [as specified in Section 3 of CIO-IT Security-08-39, Management Implementation Plan and CIO-IT Security-12-66, ISCM Strategy and OA Program].

## Control guidance

Continuous monitoring at the system level facilitates ongoing awareness of the system security and privacy posture to support organizational risk management decisions. The terms "continuous" and "ongoing" imply that organizations assess and monitor their controls and risks at a frequency sufficient to support risk-based decisions. Different types of controls may require different monitoring frequencies. The results of continuous monitoring generate risk response actions by organizations. When monitoring the effectiveness of multiple controls that have been grouped into capabilities, a root-cause analysis may be needed to determine the specific control that has failed. Continuous monitoring programs allow organizations to maintain the authorizations of systems and common controls in highly dynamic environments of operation with changing mission and business needs, threats, vulnerabilities, and technologies. Having access to security and privacy information on a continuing basis through reports and dashboards gives organizational officials the ability to make effective and timely risk management decisions, including ongoing authorization decisions.

Automation supports more frequent updates to hardware, software, and firmware inventories, authorization packages, and other system information. Effectiveness is further enhanced when continuous monitoring outputs are formatted to provide information that is specific, measurable, actionable, relevant, and timely. Continuous monitoring activities are scaled in accordance with the security categories of systems. Monitoring requirements, including the need for specific monitoring, may be referenced in other controls and control enhancements, such as [AC-2g](#ac-2_smt.g), [AC-2(7)](#ac-2.7), [AC-2(12)(a)](#ac-2.12_smt.a), [AC-2(7)(b)](#ac-2.7_smt.b), [AC-2(7)(c)](#ac-2.7_smt.c), [AC-17(1)](#ac-17.1), [AT-4a](#at-4_smt.a), [AU-13](#au-13), [AU-13(1)](#au-13.1), [AU-13(2)](#au-13.2), [CM-3f](#cm-3_smt.f), [CM-6d](#cm-6_smt.d), [CM-11c](#cm-11_smt.c), [IR-5](#ir-5), [MA-2b](#ma-2_smt.b), [MA-3a](#ma-3_smt.a), [MA-4a](#ma-4_smt.a), [PE-3d](#pe-3_smt.d), [PE-6](#pe-6), [PE-14b](#pe-14_smt.b), [PE-16](#pe-16), [PE-20](#pe-20), [PM-6](#pm-6), [PM-23](#pm-23), [PM-31](#pm-31), [PS-7e](#ps-7_smt.e), [SA-9c](#sa-9_smt.c), [SR-4](#sr-4), [SC-5(3)(b)](#sc-5.3_smt.b), [SC-7a](#sc-7_smt.a), [SC-7(24)(b)](#sc-7.24_smt.b), [SC-18b](#sc-18_smt.b), [SC-43b](#sc-43_smt.b) , and [SI-4](#si-4).

______________________________________________________________________

## What is the solution and how is it implemented?

<!-- For implementation status enter one of: implemented, partial, planned, alternative, not-applicable -->

<!-- Note that the list of rules under ### Rules: is read-only and changes will not be captured after assembly to JSON -->

### This System

<!-- Add implementation prose for the main This System component for control: ca-7 -->

#### Implementation Status: planned

______________________________________________________________________

## Implementation for part a.

### This System

<!-- Add implementation prose for the main This System component for control: ca-7_smt.a -->

#### Implementation Status: planned

### Cloud.gov

Operating systems and DB scans are out of the boundary of application owners. The requirement is bound to the application code and is the responsibility of the application owner.

#### Rules:

  - app-monitoring-scanning-required

#### Implementation Status: partial

### GitHub Actions

* continuous_monitoring DevOps staff review OWASP and Dependency scans every build, or at least weekly.
* continuous_monitoring DevOps staff and the GSA ISSO review Web Application vulnerability scans on a weekly basis.
* continuous_monitoring Administrators and DevOps staff review changes for potential security impact and engage the continuous_monitoring ISSO and ISSM who will review or engage assessment staff as needed.

#### Rules:

  - properly-configured

#### Implementation Status: partial

______________________________________________________________________

## Implementation for part b.

### This System

<!-- Add implementation prose for the main This System component for control: ca-7_smt.b -->

#### Implementation Status: planned

### Cloud.gov

Operating systems and DB scans are out of the boundary of application owners. The requirement is bound to the application code and is the responsibility of the application owner.

#### Rules:

  - app-monitoring-scanning-required

#### Implementation Status: partial

______________________________________________________________________

## Implementation for part c.

### This System

<!-- Add implementation prose for the main This System component for control: ca-7_smt.c -->

#### Implementation Status: planned

### Cloud.gov

Operating systems and DB scans are out of the boundary of application owners. The requirement is bound to the application code and is the responsibility of the application owner.

#### Rules:

  - app-monitoring-scanning-required

#### Implementation Status: partial

______________________________________________________________________

## Implementation for part d.

### This System

<!-- Add implementation prose for the main This System component for control: ca-7_smt.d -->

#### Implementation Status: planned

### Cloud.gov

Operating systems and DB scans are out of the boundary of application owners. The requirement is bound to the application code and is the responsibility of the application owner.

#### Rules:

  - app-monitoring-scanning-required

#### Implementation Status: partial

______________________________________________________________________

## Implementation for part e.

### This System

<!-- Add implementation prose for the main This System component for control: ca-7_smt.e -->

#### Implementation Status: planned

### Cloud.gov

Operating systems and DB scans are out of the boundary of application owners. The requirement is bound to the application code and is the responsibility of the application owner.

#### Rules:

  - app-monitoring-scanning-required

#### Implementation Status: partial

______________________________________________________________________

## Implementation for part f.

### This System

<!-- Add implementation prose for the main This System component for control: ca-7_smt.f -->

#### Implementation Status: planned

### Cloud.gov

Operating systems and DB scans are out of the boundary of application owners. The requirement is bound to the application code and is the responsibility of the application owner.

#### Rules:

  - app-monitoring-scanning-required

#### Implementation Status: partial

______________________________________________________________________

## Implementation for part g.

### This System

<!-- Add implementation prose for the main This System component for control: ca-7_smt.g -->

#### Implementation Status: planned

### Cloud.gov

Operating systems and DB scans are out of the boundary of application owners. The requirement is bound to the application code and is the responsibility of the application owner.

#### Rules:

  - app-monitoring-scanning-required

#### Implementation Status: partial

______________________________________________________________________