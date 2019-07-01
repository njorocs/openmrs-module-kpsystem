<%
	ui.includeCss("kenyaemrorderentry", "font-awesome.css")
	ui.includeCss("kenyaemrorderentry", "font-awesome.min.css")
	ui.includeCss("kenyaemrorderentry", "font-awesome.css.map")
	ui.includeCss("kenyaemrorderentry", "fontawesome-webfont.svg")
	def baseLink = ui.pageLink("htmlformentryui", "htmlform/flowsheet", [patientId: currentPatient.patientId, headerForm: "kenyaemr:kpEnrollmentHeaderForm.xml", returnUrl: ui.thisUrl()])
	def clinicalEncounterFlowsheets = "flowsheets=kenyaemr:kpComplaints.xml&flowsheets=kenyaemr:kpPregnancyAndFamilyPlanning.xml&flowsheets=kenyaemr:kpChronicIllnesses.xml&\n" +
			"flowsheets=kenyaemr:kpKnownAllergies.xml&flowsheets=kenyaemr:kpDrugReactions.xml&flowsheets=kenyaemr:kpImmunizationAndVaccination.xml&\n" +
			"flowsheets=kenyaemr:kpSTScreening.xml&flowsheets=kenyaemr:kpHepatitisScreening.xml&\n" +
			"flowsheets=kenyaemr:kpSystemsExamination.xml&flowsheets=kenyaemr:kpDiagnosisAndTreatmentPlan.xml&\n" +
			"flowsheets=kenyaemr:kpClinicalNotes.xml&flowsheets=kenyaemr:kpAppointmentCreation.xml"

	def psychosocialFlowsheets = "flowsheets=kenyaemr:kpPsychosocialScreening.xml&flowsheets=kenyaemr:kpViolenceScreening.xml&flowsheets=kenyaemr:kpCounsellingServices.xml"
	def pepPrepFlowsheets = "flowsheets=kenyaemr:kpPrepPepScreening.xml"

	def clinicalEncounterFlowsheeturl = baseLink + clinicalEncounterFlowsheets
	def psychosocialFlowsheeturl = baseLink + psychosocialFlowsheets
	def pepPrepFlowsheeturl = baseLink + pepPrepFlowsheets


%>

<div class="action-container column">
	<div class="action-section">

		${ ui.includeFragment("kenyaemr", "visitMenu", [ patient: currentPatient, visit: activeVisit ])}

		<ul class="float-left">
			<h3>General Actions</h3>
			<li class="float-left" style="margin-top: 7px">
				<a href="${ ui.pageLink("registrationapp", "registerPatient", [appId:"referenceapplication.registrationapp.registerPatient"]) }" class="float-left">
					<i class="fa fa-user"></i>
					Register Client
				</a>
			</li>
		</ul>
		<ul>
			<h3>Flowsheets</h3>

			<li class="float-left" style="margin-top: 7px">
				<a href="${ clinicalEncounterFlowsheeturl }" class="float-left">
					<i class="fa fa-files-o"></i>
					Clinical Encounter
				</a>
			</li>
			<li class="float-left" style="margin-top: 7px">
				<a href="${ psychosocialFlowsheeturl }" class="float-left">
					<i class="fa fa-files-o"></i>
					Psychosocial Screening
				</a>
			</li>
			<li class="float-left" style="margin-top: 7px">
				<a href="${ pepPrepFlowsheeturl }" class="float-left">
					<i class="fa fa-files-o"></i>
					PEP and PREP Screening
				</a>
			</li>
		</ul>
		<ul>
			<h3>Visit Actions</h3>

			<li class="float-left" style="margin-top: 7px">
				<a href="${ ui.pageLink("kenyaemrorderentry", "drugOrders", [patient: currentPatient]) }" class="float-left">
					<i class="fa fa-medkit fa-2x"></i>
					Drug Orders
				</a>
			</li>
			<li class="float-left" style="margin-top: 7px">
				<a href="${ ui.pageLink("kenyaemrorderentry", "labOrders", [patient: currentPatient]) }" class="float-left">
					<i class="fa fa-flask fa-2x"></i>
					Lab Orders
				</a>
			</li>
			<li class="float-left" style="margin-top: 7px">
				<a href="${ ui.pageLink("htmlformentryui", "htmlform/enterHtmlFormWithStandardUi", [patientId: currentPatient.patientId, definitionUiResource: "kenyaemr:simpleuiforms/simpleVisitNote.xml", returnUrl: ui.thisUrl()]) }" class="float-left">
					<i class="fa fa-plus-square fa-2x"></i>
					Diagnosis
				</a>
			</li>
			<li class="float-left" style="margin-top: 7px">
				<a href="${ ui.pageLink("hivtestingservices", "patientContactList", [patientId: currentPatient.patientId]) }" class="float-left">
					<i class="fa fa-list-ul fa-2x"></i>
					Contact Listing
				</a>
			</li>
			<li class="float-left" style="margin-top: 7px">
				<a href="${ ui.pageLink("openhmis.inventory", "createOperation/entities", [patientId: currentPatient.patientId]) }" class="float-left">
					<i class="fa fa-cubes fa-2x"></i>
					Commodities
				</a>
			</li>
		</ul>
		<ul  id ="community-outreach-tools">

			<h3>Community Outreach Tools</h3>
			<li class="float-left" style="margin-top: 7px">
				<%
					def onCOFormClick = { form ->
						def visitId = currentVisit ? currentVisit.id : activeVisit.id
						def opts = [ appId: currentApp.id, visitId: visitId, formUuid: form.formUuid, returnUrl: ui.thisUrl() ]
						"""ui.navigate('${ ui.pageLink('kenyaemr', 'enterForm', opts) }');"""
					}
				%>

				${ ui.includeFragment("kenyaui", "widget/formLightStack", [ forms: communityOutreachForms, onFormClick: onCOFormClick ]) }

			</a>
			</li>

		</ul>
		<ul id = "clinical-tools">

			<h3>Clinical Tools</h3>
			<li class="float-left" style="margin-top: 7px">
				<%
					def onCFFormClick = { form ->
						def visitId = currentVisit ? currentVisit.id : activeVisit.id
						def opts = [ appId: currentApp.id, visitId: visitId, formUuid: form.formUuid, returnUrl: ui.thisUrl() ]
						"""ui.navigate('${ ui.pageLink('kenyaemr', 'enterForm', opts) }');"""
					}
				%>

				${ ui.includeFragment("kenyaui", "widget/formLightStack", [ forms: clinicalForms, onFormClick: onCFFormClick ]) }

			</a>
			</li>

		</ul>
		<ul id="program-level-tools">

			<h3>Program Level Tools</h3>
			<li class="float-left" style="margin-top: 7px">
				<%
					def onPLFormClick = { form ->
						def visitId = currentVisit ? currentVisit.id : activeVisit.id
						def opts = [ appId: currentApp.id, visitId: visitId, formUuid: form.formUuid, returnUrl: ui.thisUrl() ]
						"""ui.navigate('${ ui.pageLink('kenyaemr', 'enterForm', opts) }');"""
					}
				%>

				${ ui.includeFragment("kenyaui", "widget/formLightStack", [ forms: programLevelForms, onFormClick: onPLFormClick ]) }

			</a>
			</li>

		</ul>

		<ul id="other-tools">

			<h3>Other Tools</h3>
			<li class="float-left" style="margin-top: 7px">
				<%
					def onOtherFormClick = { form ->
						def visitId = currentVisit ? currentVisit.id : activeVisit.id
						def opts = [ appId: currentApp.id, visitId: visitId, formUuid: form.formUuid, returnUrl: ui.thisUrl() ]
						"""ui.navigate('${ ui.pageLink('kenyaemr', 'enterForm', opts) }');"""
					}
				%>

				${ ui.includeFragment("kenyaui", "widget/formLightStack", [ forms: otherForms, onFormClick: onOtherFormClick ]) }

			</a>
			</li>

		</ul>

		<ul>
			<h3>Completed Forms</h3>
			<li class="float-left" style="margin-top: 7px">
				<%
					def onEncounterClick = { encounter ->
						"""kenyaemr.openEncounterDialog('${ currentApp.id }', ${ encounter.id });"""
					}
				%>
				${ ui.includeFragment("kenyaemr", "widget/encounterLightStack", [ encounters: encounters, onEncounterClick: onEncounterClick ]) }
			</a>
			</li>

		</ul>

	</div>
</div>
<script type="text/javascript">

    //On ready
    jQuery(function () {
        //defaults

         <% if (programLevelForms) { %>
        jQuery("#program-level-tools").show();
        <% } else { %>
        jQuery("#program-level-tools").hide();
        <% } %>

        <% if (clinicalForms) { %>
        jQuery("#clinical-tools").show();
        <% } else { %>
        jQuery("#clinical-tools").hide();
        <% } %>

        <% if (communityOutreachForms) { %>
        jQuery("#community-outreach-tools").show();
        <% } else { %>
        jQuery("#community-outreach-tools").hide();
        <% } %>

        <% if (otherForms) { %>
        jQuery("#other-tools").show();
        <% } else { %>
        jQuery("#other-tools").hide();
        <% } %>
    });
</script>