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
    - name: app-log-monitoring
      description: Application owners are responsible for monitoring their application
        logs
  DevTools Cloud.gov:
    - name: ssh-access-disabled
      description: Production spaces should disable ssh access
    - name: ssh-access-disabled
      description: Production spaces should disable ssh access
x-trestle-rules-params:
  DevTools Cloud.gov:
    - name: gov.cloud.space-names
      description: The cloud.gov spaces in which ssh access should be disabled
      options: rahearn
      rule-id: ssh-access-disabled
    - name: gov.cloud.org-name
      description: The cloud.gov org in which ssh access should be disabled
      options: gsa-tts-devtools-prototyping
      rule-id: ssh-access-disabled
x-trestle-comp-def-rules-param-vals:
  # You may set new values for rule parameters by adding
  #
  # ssp-values:
  #   - value 1
  #   - value 2
  #
  # below a section of values:
  # The values list refers to the values as set by the components, and the ssp-values are the new values
  # to be placed in SetParameters of the SSP.
  #
  DevTools Cloud.gov:
    - name: gov.cloud.org-name
      values:
        - gsa-tts-devtools-prototyping
    - name: gov.cloud.space-names
      values:
        - rahearn
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
  si-04_odp.01:
    guidelines:
      - prose: monitoring objectives to detect attacks and indicators of potential
          attacks on the system are defined;
    values:
      - ensuring the proper functioning of internal processes and controls in furtherance
        of regulatory and compliance requirements; examining system records to confirm
        that the system is functioning in an optimal, resilient, and secure state;
        identifying irregularities or anomalies that are indicators of a system malfunction
        or compromise
    alt-identifier: si-4_prm_1
  si-04_odp.02:
    guidelines:
      - prose: techniques and methods used to identify unauthorized use of the system
          are defined;
    values:
      - a variety of sources including but not limited to continuous monitoring vulnerability
        scans, malicious code protection mechanisms, intrusion detection or prevention
        mechanisms, or boundary protection devices such as firewalls, gateways, and
        routers
    alt-identifier: si-4_prm_2
  si-04_odp.03:
    guidelines:
      - prose: system monitoring information to be provided to personnel or roles
          is defined;
    values:
      - the GSA S/SO or Contractor recommended and GSA CISO and AO approved information
        system monitoring information
    alt-identifier: si-4_prm_3
  si-04_odp.04:
    guidelines:
      - prose: personnel or roles to whom system monitoring information is to be provided
          is/are defined;
    values:
      - ISSM, ISSO, and System Program Managers who distribute the information to
        other personnel with system administration, monitoring, and/or security responsibilities
    alt-identifier: si-4_prm_4
  si-04_odp.05:
    values:
      - within the timeframe(s) specified in the applicable system security and privacy
        plan
    alt-identifier: si-4_prm_5
  si-04_odp.06:
    guidelines:
      - prose: a frequency for providing system monitoring to personnel or roles is
          defined (if selected);
    values:
      - within the timeframe(s) specified in the applicable system security and privacy
        plan
    alt-identifier: si-4_prm_6
x-trestle-global:
  profile:
    title: 'Lightweight Security Authorization Process: System Security and Privacy
      Plan'
    href: trestle://profiles/lato/profile.json
  sort-id: si-04
---

# si-4 - \[\] System Monitoring

## Control Statement

- \[a.\] Monitor the system to detect:

  - \[1.\] Attacks and indicators of potential attacks in accordance with the following monitoring objectives: [ensuring the proper functioning of internal processes and controls in furtherance of regulatory and compliance requirements; examining system records to confirm that the system is functioning in an optimal, resilient, and secure state; identifying irregularities or anomalies that are indicators of a system malfunction or compromise] ; and
  - \[2.\] Unauthorized local, network, and remote connections;

- \[b.\] Identify unauthorized use of the system through the following techniques and methods: [a variety of sources including but not limited to continuous monitoring vulnerability scans, malicious code protection mechanisms, intrusion detection or prevention mechanisms, or boundary protection devices such as firewalls, gateways, and routers];

- \[c.\] Invoke internal monitoring capabilities or deploy monitoring devices:

  - \[1.\] Strategically within the system to collect organization-determined essential information; and
  - \[2.\] At ad hoc locations within the system to track specific types of transactions of interest to the organization;

- \[d.\] Analyze detected events and anomalies;

- \[e.\] Adjust the level of system monitoring activity when there is a change in risk to organizational operations and assets, individuals, other organizations, or the Nation;

- \[f.\] Obtain legal opinion regarding system monitoring activities; and

- \[g.\] Provide [the GSA S/SO or Contractor recommended and GSA CISO and AO approved information system monitoring information] to [ISSM, ISSO, and System Program Managers who distribute the information to other personnel with system administration, monitoring, and/or security responsibilities] [within the timeframe(s) specified in the applicable system security and privacy plan].

## Control Assessment Objective

- \[SI-04a.\]

  - \[SI-04a.01\] the system is monitored to detect attacks and indicators of potential attacks in accordance with [ensuring the proper functioning of internal processes and controls in furtherance of regulatory and compliance requirements; examining system records to confirm that the system is functioning in an optimal, resilient, and secure state; identifying irregularities or anomalies that are indicators of a system malfunction or compromise];
  - \[SI-04a.02\]

    - \[SI-04a.02[01]\] the system is monitored to detect unauthorized local connections;
    - \[SI-04a.02[02]\] the system is monitored to detect unauthorized network connections;
    - \[SI-04a.02[03]\] the system is monitored to detect unauthorized remote connections;

- \[SI-04b.\] unauthorized use of the system is identified through [a variety of sources including but not limited to continuous monitoring vulnerability scans, malicious code protection mechanisms, intrusion detection or prevention mechanisms, or boundary protection devices such as firewalls, gateways, and routers];

- \[SI-04c.\]

  - \[SI-04c.01\] internal monitoring capabilities are invoked or monitoring devices are deployed strategically within the system to collect organization-determined essential information;
  - \[SI-04c.02\] internal monitoring capabilities are invoked or monitoring devices are deployed at ad hoc locations within the system to track specific types of transactions of interest to the organization;

- \[SI-04d.\]

  - \[SI-04d.[01]\] detected events are analyzed;
  - \[SI-04d.[02]\] detected anomalies are analyzed;

- \[SI-04e.\] the level of system monitoring activity is adjusted when there is a change in risk to organizational operations and assets, individuals, other organizations, or the Nation;

- \[SI-04f.\] a legal opinion regarding system monitoring activities is obtained;

- \[SI-04g.\] [the GSA S/SO or Contractor recommended and GSA CISO and AO approved information system monitoring information] is provided to [ISSM, ISSO, and System Program Managers who distribute the information to other personnel with system administration, monitoring, and/or security responsibilities] [within the timeframe(s) specified in the applicable system security and privacy plan].

## Control guidance

System monitoring includes external and internal monitoring. External monitoring includes the observation of events occurring at external interfaces to the system. Internal monitoring includes the observation of events occurring within the system. Organizations monitor systems by observing audit activities in real time or by observing other system aspects such as access patterns, characteristics of access, and other actions. The monitoring objectives guide and inform the determination of the events. System monitoring capabilities are achieved through a variety of tools and techniques, including intrusion detection and prevention systems, malicious code protection software, scanning tools, audit record monitoring software, and network monitoring software.

Depending on the security architecture, the distribution and configuration of monitoring devices may impact throughput at key internal and external boundaries as well as at other locations across a network due to the introduction of network throughput latency. If throughput management is needed, such devices are strategically located and deployed as part of an established organization-wide security architecture. Strategic locations for monitoring devices include selected perimeter locations and near key servers and server farms that support critical applications. Monitoring devices are typically employed at the managed interfaces associated with controls [SC-7](#sc-7) and [AC-17](#ac-17) . The information collected is a function of the organizational monitoring objectives and the capability of systems to support such objectives. Specific types of transactions of interest include Hypertext Transfer Protocol (HTTP) traffic that bypasses HTTP proxies. System monitoring is an integral part of organizational continuous monitoring and incident response programs, and output from system monitoring serves as input to those programs. System monitoring requirements, including the need for specific types of system monitoring, may be referenced in other controls (e.g., [AC-2g](#ac-2_smt.g), [AC-2(7)](#ac-2.7), [AC-2(12)(a)](#ac-2.12_smt.a), [AC-17(1)](#ac-17.1), [AU-13](#au-13), [AU-13(1)](#au-13.1), [AU-13(2)](#au-13.2), [CM-3f](#cm-3_smt.f), [CM-6d](#cm-6_smt.d), [MA-3a](#ma-3_smt.a), [MA-4a](#ma-4_smt.a), [SC-5(3)(b)](#sc-5.3_smt.b), [SC-7a](#sc-7_smt.a), [SC-7(24)(b)](#sc-7.24_smt.b), [SC-18b](#sc-18_smt.b), [SC-43b](#sc-43_smt.b) ). Adjustments to levels of system monitoring are based on law enforcement information, intelligence information, or other sources of information. The legality of system monitoring activities is based on applicable laws, executive orders, directives, regulations, policies, standards, and guidelines.

______________________________________________________________________

## What is the solution and how is it implemented?

<!-- For implementation status enter one of: implemented, partial, planned, alternative, not-applicable -->

<!-- Note that the list of rules under ### Rules: is read-only and changes will not be captured after assembly to JSON -->

### This System

<!-- Add implementation prose for the main This System component for control: si-4 -->

#### Implementation Status: planned

______________________________________________________________________

## Implementation for part a.

### Cloud.gov

Application owners are responsible for monitoring their application logs for signs of unauthorized activity according to laws and regulations, and applying heightened scrutiny when there is an indication of increased risk.

#### Rules:

  - app-log-monitoring

#### Implementation Status: partial

### DevTools Cloud.gov

The only type of remote connections available within cloud.gov are via SSH to the application containers. There is no other ability for local, remote, or network connections. By default, SSH access to the production space is turned off, except in the event of a security investigation or application failure/performance issues by System Administrators.

#### Rules:

  - ssh-access-disabled

#### Implementation Status: implemented

______________________________________________________________________

## Implementation for part b.

### Cloud.gov

Application owners are responsible for monitoring their application logs for signs of unauthorized activity according to laws and regulations, and applying heightened scrutiny when there is an indication of increased risk.

#### Rules:

  - app-log-monitoring

#### Implementation Status: partial

### DevTools Cloud.gov

SSH Access has been disabled to production spaces {{ insert: param, gov.cloud.space-names }} in organization {{ insert: param, gov.cloud.org-name }} to limit potential unauthorized use.

#### Rules:

  - ssh-access-disabled

#### Implementation Status: implemented

______________________________________________________________________

## Implementation for part c.

### Cloud.gov

Application owners are responsible for monitoring their application logs for signs of unauthorized activity according to laws and regulations, and applying heightened scrutiny when there is an indication of increased risk.

#### Rules:

  - app-log-monitoring

#### Implementation Status: partial

______________________________________________________________________

## Implementation for part d.

### Cloud.gov

Application owners are responsible for monitoring their application logs for signs of unauthorized activity according to laws and regulations, and applying heightened scrutiny when there is an indication of increased risk.

#### Rules:

  - app-log-monitoring

#### Implementation Status: partial

______________________________________________________________________

## Implementation for part e.

### Cloud.gov

Application owners are responsible for monitoring their application logs for signs of unauthorized activity according to laws and regulations, and applying heightened scrutiny when there is an indication of increased risk.

#### Rules:

  - app-log-monitoring

#### Implementation Status: partial

______________________________________________________________________

## Implementation for part f.

### Cloud.gov

Application owners are responsible for monitoring their application logs for signs of unauthorized activity according to laws and regulations, and applying heightened scrutiny when there is an indication of increased risk.

#### Rules:

  - app-log-monitoring

#### Implementation Status: partial

______________________________________________________________________

## Implementation for part g.

### Cloud.gov

Application owners are responsible for monitoring their application logs for signs of unauthorized activity according to laws and regulations, and applying heightened scrutiny when there is an indication of increased risk.

#### Rules:

  - app-log-monitoring

#### Implementation Status: partial

______________________________________________________________________
