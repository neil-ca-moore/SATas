package uk.co.bigoh.SATas.core
{
	import uk.co.bigoh.SATas.error.SolverError;

	public class SimpleVariables implements Variables
	{
		private var vars:Array; //TODO more efficient data structures
		private var isset:Array;
		
		private var trail:Array; //-1 for push, otherwise index of set variable
		
		public function SimpleVariables()
		{
			vars = new Array();
			isset = new Array();
			trail = new Array();
		}
		
		public function create(i:int):void
		{
			vars.length += i;
			isset.length += i;
		}
		
		public function set(i:int, b:Boolean):void
		{
			if(i >= vars.length)
				throw new SolverError("variable doesn't exist");
			if(vars[i] != null)
				throw new SolverError("already set");
			vars[i] = b;
			isset[i] = true;
			trail.push(i);
		}
		
		public function get(i:int):Boolean
		{
			if(i >= vars.length)
				throw new SolverError("variable doesn't exist");
			if(isset[i])
				return vars[i];
			else
				throw new SolverError("variable not set, so can't get() it");
		}
		
		public function isSet(i:int):Boolean
		{
			return isset[i];
		}
		
		public function push():void
		{
			trail.push(-1);
		}
		
		public function pop():void
		{
			var idx:int;
			while(true)
			{
				if(trail.length == 0)
					break;
				idx = int(trail.pop());
				if(idx == -1)
					return;
				else
					isset[idx] = false;
			}
			throw new SolverError("tried to pop at root node");
		}
		
		public function length():int
		{
			return vars.length;
		}
	}
}