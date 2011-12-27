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