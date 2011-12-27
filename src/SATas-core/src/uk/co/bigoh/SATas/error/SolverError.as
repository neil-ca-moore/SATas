package uk.co.bigoh.SATas.error
{
	public class SolverError extends Error
	{
		public function SolverError(message:*="", id:*=0)
		{
			super(message, id);
		}
	}
}