/*
This file is part of SATas.

SATas is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your
option) any later version.

SATas is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

You should have received a copy of the GNU General Public License
along with SATas.  If not, see <http://www.gnu.org/licenses/>.
*/

package uk.co.bigoh.SATas.core
{
	import org.flexunit.asserts.assertEquals;
	import org.mockito.integrations.flexunit4.MockitoClassRunner;
	import org.mockito.integrations.given;
	
	[RunWith("org.mockito.integrations.flexunit4.MockitoClassRunner")]
	public class SimpleOrderTest
	{	
		private var mockitoClassRunner:MockitoClassRunner;
		
		private var order:SimpleOrder;
		
		[Mock(type="uk.co.bigoh.SATas.core.SimpleVariables")]
		public var vars:SimpleVariables;
		
		[Before]
		public function before():void
		{
			order = new SimpleOrder(vars);
		}
		
		[Test]
		public function getsFirstUnsetVariable():void
		{
			//given
			given(vars.length()).willReturn(3);
			given(vars.isSet(0)).willReturn(false);
			//when
			var next:int = order.next();
			//then
			assertEquals(next, 0);
		}
		
		[Test]
		public function getsSubsequentUnsetVariable():void
		{
			//given
			given(vars.length()).willReturn(3);
			given(vars.isSet(0)).willReturn(true);
			given(vars.isSet(1)).willReturn(false);
			//when
			var next:int = order.next();
			//then
			assertEquals(next, 1);
		}
		
		[Test]
		public function getsLastUnsetVariable():void
		{
			//given
			given(vars.length()).willReturn(3);
			given(vars.isSet(0)).willReturn(true);
			given(vars.isSet(1)).willReturn(true);
			given(vars.isSet(1)).willReturn(false);
			//when
			var next:int = order.next();
			//then
			assertEquals(next, 2);
		}
		
		[Test(expected="uk.co.bigoh.SATas.error.SolverError")]
		public function failsWhenNoVariables():void
		{
			//given
			given(vars.length()).willReturn(0);
			//when
		 	order.next();
			//then
			//exception
		}
		
		public function returnsMinusOneWhenNothingUnset():void
		{
			//given
			given(vars.length()).willReturn(1);
			given(vars.isSet(0)).willReturn(true);
			//when
			var next:int = order.next();
			//then
			assertEquals(next, -1);
		}
	}
}