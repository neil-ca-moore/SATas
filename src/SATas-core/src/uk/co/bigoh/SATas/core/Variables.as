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
	public interface Variables
	{
		function create(i:int):void;
		
		function set(i:int, b:Boolean):void;
		
		function get(i:int):Boolean;
		
		function isSet(i:int):Boolean;
		
		function push():void;
		
		function pop():void;
		
		function length():int;
	}
}