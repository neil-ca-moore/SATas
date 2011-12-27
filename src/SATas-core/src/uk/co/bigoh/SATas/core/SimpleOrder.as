package uk.co.bigoh.SATas.core
{
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
				throw new Error("nothing unset");
			else
				return -1;
		}
	}
}