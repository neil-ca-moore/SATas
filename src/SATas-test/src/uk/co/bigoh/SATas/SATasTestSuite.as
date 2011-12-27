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

package uk.co.bigoh.SATas
{
	import org.mockito.integrations.flexunit4.MockitoClassRunner;
	
	import uk.co.bigoh.SATas.core.DimacsParserTest;
	import uk.co.bigoh.SATas.core.SimpleOrderTest;
	import uk.co.bigoh.SATas.core.SimpleVariablesTest;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class SATasTestSuite
	{
		private var mockitoRunner:MockitoClassRunner;
		public var variableTest:SimpleVariablesTest;
		public var orderTest:SimpleOrderTest;
		public var dimacsParserTest:DimacsParserTest;
	}
}