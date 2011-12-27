package uk.co.bigoh.SATas.core
{
	import org.flexunit.asserts.assertEquals;
	import org.mockito.integrations.flexunit4.MockitoClassRunner;
	import org.mockito.integrations.given;
	import org.mockito.integrations.verify;
	
	[RunWith("org.mockito.integrations.flexunit4.MockitoClassRunner")]
	public class DimacsParserTest
	{
		private var mockitoClassRunner:MockitoClassRunner;
		
		[Mock(type="uk.co.bigoh.SATas.core.SimpleVariables")]
		public var vars:SimpleVariables;
		
		[Mock(type="uk.co.bigoh.SATas.core.Constraints")]
		public var cons:Constraints;
		
		private var dimacsParser:DimacsParser;
		
		[Before]
		public function before():void
		{
			dimacsParser = new DimacsParser(vars, cons);
		}
		
		[Test]
		public function shouldCreateCorrectNumVars():void
		{
			//given
			//when
			dimacsParser.parse((
				<![CDATA[
				p cnf 3 2
				1 -3 0
				2 3 -1 0 
				]]>).toString());
			//then
			verify().that(vars.create(3));
		}
		
		[Test]
		public function shouldIgnoreComments():void
		{
			//given
			//when
			dimacsParser.parse((
				<![CDATA[
				c fjhsdjkhfkjdsf
				p CNF 3 2
				1 -3 0
				c dsjhfdskhf
				2 3 -1 0 
				c dsfsjh
				]]>).toString());
			//then
			//no exception
		}
		
		[Test(expected="uk.co.bigoh.SATas.error.SolverError")]
		public function shouldVerifyContentsAreCnf():void
		{
			//given
			//when
			dimacsParser.parse((
				<![CDATA[
				p XXX 3 2
				1 -3 0
				2 3 -1 0 
				]]>).toString());
			//then
			//exception
		}
		
		[Test]
		public function shouldPostConstraints():void
		{
			//given
			//when
			dimacsParser.parse((
				<![CDATA[
				p CNF 3 2
				1 -3 0
				2 3 -1 0 
				]]>).toString());
			//then
			verify().that(cons.create(1, -3));
			verify().that(cons.create(2, 3, -1));
		}
		
		[Test]
		public function handlesUnusualSpacing():void
		{
			//given
			//when
			dimacsParser.parse((
				<![CDATA[
				p   CNF  3  2
				1 -3 0
				2 3 -1 0 
				]]>).toString());
			//then
			verify().that(vars.create(3));
		}
		
		[Test(expected="uk.co.bigoh.SATas.error.SolverError")]
		public function handlesMissingItemsInPLine():void
		{
			//given
			//when
			dimacsParser.parse((
				<![CDATA[
				p 3 2
				1 -3 0
				2 3 -1 0 
				]]>).toString());
			//then
			verify().that(vars.create(3));
		}
		
		[Test(expected="uk.co.bigoh.SATas.error.SolverError")]
		public function handlesMixedUpItemsInPLine():void
		{
			//given
			//when
			dimacsParser.parse((
				<![CDATA[
				p 3 cnf 2
				1 -3 0
				2 3 -1 0 
				]]>).toString());
			//then
			verify().that(vars.create(3));
		}
		
		[Test]
		public function ignoresMissingConstraints():void
		{
			//given
			//when
			dimacsParser.parse((
				<![CDATA[
				p cnf 3 2
				2 3 -1 0 
				]]>).toString());
			//then
			verify().that(vars.create(3));
		}
		
		[Test(expected="uk.co.bigoh.SATas.error.SolverError")]
		public function pLineShouldBeFirstNonCommentLine():void
		{
			//given
			//when
			dimacsParser.parse((
				<![CDATA[
				2 3 -1 0
				]]>).toString());
			//then
			//exception
		}
			
		[Test(expected="uk.co.bigoh.SATas.error.SolverError")]
		public function constraintLineMustEndWithZero():void
		{
			//given
			//when
			dimacsParser.parse((
				<![CDATA[
				p cnf 3 2
				2 3 -1
				]]>).toString());
			//then
			//exception
		}
	}
}