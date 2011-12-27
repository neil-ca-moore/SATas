package uk.co.bigoh.SATas.core
{
	import mx.utils.StringUtil;
	
	import uk.co.bigoh.SATas.error.SolverError;

	public class DimacsParser
	{
		private var vars:Variables;
		private var cons:Constraints;
		
		public function DimacsParser(vars:Variables, cons:Constraints)
		{
			this.vars = vars;
			this.cons = cons;
		}
		
		public function parse(s:String):void
		{
			var lines:Array = StringUtil.trim(s).split("\n");
			var foundPLine:Boolean = false;
			try {
				for each(var line:String in lines)
				{
					var words:Array = StringUtil.trim(line).split(/\s+/);
					var lineType:String = words[0];
					if(lineType == "p") {
						foundPLine = true;
						var dataType:String = words[1];
						if(dataType.toLowerCase() != "cnf")
							throw new SolverError("parse error: not a CNF");
							vars.create(int(words[2]));
							var conCount:int = int(words[3]);
					} else if(lineType.match(/^\d+$/)) {
						if(!foundPLine)
							throw new SolverError("parse error: didn't find p line before first constraint");
						if(int(words.pop()) != 0)
							throw new SolverError("parse error: constraint line must end with 0");
						cons.create.apply(cons, words);
					} else if(lineType != "c") {
						throw new SolverError("parse error: wrong line type");
						break;
					}
				}
			} catch (e:Error) {
				throw new SolverError("parse error: expected number, got something else");
			}
		}
	}
}