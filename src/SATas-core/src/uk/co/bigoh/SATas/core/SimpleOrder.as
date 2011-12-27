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
	import uk.co.bigoh.SATas.error.SolverError;

	public class SimpleOrder implements Order
	{
		private var vars:Variables;
		
		public function SimpleOrder(vars:Variables)
		{
			this.vars = vars;
		}
		
		public function next():int
		{
			const count:int = vars.length();
			for(var i:int = 0; i < count; i++)
				if(!vars.isSet(i))
					return i;
			if(count == 0)
				throw new SolverError("nothing unset");
			else
				return -1;
		}
	}
}