package uk.co.bigoh.SATas.core
{
	import org.mockito.MockitoTestCase;
	
	[RunWith("org.mockito.integrations.flexunit4.MockitoClassRunner")]
	public class SimpleVariablesTest extends MockitoTestCase
	{	
		private var vars:SimpleVariables;
		
		public function SimpleVariablesTest()
		{
			super([]);
		}
		
		[Before]
		public function before():void
		{
			vars = new SimpleVariables();
		}
		
		[Test] 
		public function enoughVariablesAreCreated():void
		{
			//given
			const COUNT:int = 10;
			vars.create(COUNT);
			//when
			for(var i:int = 0; i < COUNT; i++)
				vars.set(i, true);
			//then
			for(var j:int = 0; j < COUNT; j++)
				assertTrue(vars.isSet(j));
		}
		
		[Test]
		public function checkingGetSetValueWorks():void
		{
			//given
			vars.create(1);
			//when
			vars.set(0, true);
			//then
			assertTrue(vars.get(0));
		}
		
		[Test(expected="uk.co.bigoh.SATas.error.SolverError")]
		public function gettingUnsetValueFails():void
		{
			//given
			vars.create(1);
			//when
			//then
			vars.get(0);
		}
		
		[Test]
		public function checkingIsSetWorks():void
		{
			//given
			vars.create(2);
			//when
			//then
			assertFalse(vars.isSet(1));
			
			//when
			vars.set(1, false);
			//then
			assertTrue(vars.isSet(1));
		}
		
		[Test]
		public function valueSameAfterAPushAndPop():void
		{
			//given
			vars.create(1);
			//when
			vars.set(0, true);
			vars.push();
			vars.pop();
			//then
			assertTrue(vars.isSet(0));
			assertTrue(vars.get(0));
		}
		
		[Test]
		public function unsetAfterAPushAndPop():void
		{
			//given
			vars.create(1);
			//when
			vars.push();
			vars.set(0, true);
			vars.pop();
			//then
			assertFalse(vars.isSet(0));
		}
		
		[Test(expected="uk.co.bigoh.SATas.error.SolverError")]
		public function valueCanOnlyBeSetOnce():void
		{
			//given
			vars.create(1);
			//when
			vars.set(0, false);
			vars.set(0, false);
			//then
			//exception
		}
			
		[Test(expected="uk.co.bigoh.SATas.error.SolverError")]
		public function cantSetOutOfRangeVariable():void
		{
			//given
			//when
			vars.set(0, false);
			//then
			//exception
		}
		
		[Test(expected="uk.co.bigoh.SATas.error.SolverError")]
		public function poppingAtDepthZeroFails():void
		{
			//given
			//when
			vars.pop();
			//then
			//exception
		}
		
		[Test]
		public function lengthWorks():void
		{
			//given
			//when
			vars.create(2);
			vars.create(3);
			//then
			assertEquals(vars.length(), 5);
		}
	}
}