<%
	// config supports "page", which will set up a clickFunction, that will have providerId=... appended
	// provides a default numResultsFormatter to widget/stack unless you override it
	
	if (!config.numResultsFormatter) {
		config.numResultsFormatter = """function(listOfItems) { return listOfItems.length + " provider(s)"; }""" 
	}
	
	def clickFunction = null
	if (config.page) {
		clickFunction = """function () {
				location.href = ui.pageLink('kenyaemr', '${ config.page }', { providerId: jq(this).find('input[name=providerId]').val() });
			}"""
	}
%>
<script type="text/javascript">
	var providerItemOpts = {
		icon: '<img width="32" height="32" src="${ ui.resourceLink('uilibrary', 'images/user_business_32.png') }"/>',
		title: function(provider) {
			return (provider.person ? provider.person.personName : provider.name) + '<input type="hidden" name="providerId" value="' + provider.providerId + '"/>';
		},
		leftDetails: function(provider) {
			var ret = '';
			if (provider.identifier)
				ret += provider.identifier;
			return ret;
		},
		right: function(provider) {
			var ret = '';
			if (provider.attributes) {
				for (var i = 0; i < provider.attributes.length; ++i) {
					ret += provider.attributes[i].attributeType + ': ' + provider.attributes[i].value;
				}
			}
			return ret;
		}
	};
	
	function formatProviderAsStackItem(provider) {
		return kenyaemr.twoColumnStackItemFormatter(provider, providerItemOpts);
	}
</script>

<%= ui.includeFragment("kenyaemr", "widget/stack", config.merge([ itemFormatter: "formatProviderAsStackItem", clickFunction: clickFunction ])) %>