package uk.co.bigoh.SATas
{
	import org.mockito.integrations.flexunit4.MockitoClassRunner;
	
	import uk.co.bigoh.SATas.core.VariableTest;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class SATasTestSuite
	{
		private var mockitoRunner:MockitoClassRunner;
		public var variableTest:VariableTest;
	}
}