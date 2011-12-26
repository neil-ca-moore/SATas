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
	}
}