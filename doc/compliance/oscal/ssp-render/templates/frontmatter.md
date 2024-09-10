<center>

# U.S. General Services Administration

# {{ ssp.system_characteristics.system_name }} ({{ ssp.system_characteristics.system_name_short }})
# Lightweight Security Authorization Process
# System Security and Privacy Plan (SSPP)
# {% md_datestamp format='%B %d, %Y' %}

![GSAIT Logo](./img/gsa_it_logo.png)

</center>

<div class="pagebreak"></div>

Document Prepared By
<table>
<tbody>
{% for party in ssp_interface.get_parties_for_role(ssp.metadata.responsible_parties, "prepared-by") %}
<tr>
<th scope="row">{{ party.type.value.title() }} Name</th><td>{{ party.name }}</td>
</tr>
<tr>
{% set address = ssp_interface.first_array_entry(party.addresses) %}
{% set addr_lines = ssp_interface.safe_retrieval(address, "addr_lines", []) %}
<th scope="row">Address Line 1</th><td>{{ addr_lines[0] }}</td>
</tr>
<tr>
<th scope="row">Address Line 2</th><td>{{ addr_lines[1] }}</td>
</tr>
<tr>
<th scope="row">City, State Zip</th><td>{{ ssp_interface.safe_retrieval(address, "city") }}, {{ ssp_interface.safe_retrieval(address, "state") }} {{ ssp_interface.safe_retrieval(address, "postal_code") }}</td>
</tr>
{% endfor %}
</tbody>
</table>

<div class="pagebreak"></div>

Document Revision History

| Date | Comments | Version | Author |
| ---- | -------- | ------- | ------ |
| | | | |

<div class="pagebreak"></div>
