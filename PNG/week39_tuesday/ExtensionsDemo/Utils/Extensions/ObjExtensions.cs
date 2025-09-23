public static class ObjExtensions
{
    // att titta på object här gör att vi kan använda det på alla objekt, oavsett string/char/int/double etc
    public static void CheckForNull(this object obj, string paramName)
    {
        if (obj == null)
            throw new ArgumentNullException(paramName, "Värdet får inte vara null");
    }
}