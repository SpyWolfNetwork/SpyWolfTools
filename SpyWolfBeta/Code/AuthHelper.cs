using System.Web;

namespace SpyWolfBeta.Model {
    public class ApplicationUserModel {

        public string UserName { get; set; }
        public string Name { get; set; }
        //public string LastName { get; set; }
        public string Email { get; set; }
        public string AvatarUrl { get; set; }
        public int studentId { get; set; }
        public int userId { get; set; }
        public bool IsAdmin { get; set; }
        public bool IsModerator { get; set; }
        public bool IsStudent { get; set; }
        public bool IsTeacher { get; set; }

    }

    public static class AuthHelper {
        public static bool SignIn(string userName, string password) {
            HttpContext.Current.Session["User"] = CreateDefualtUser();  // Mock user data
            return true;
        }
        public static void SignOut() {
            HttpContext.Current.Session["User"] = null;
        }
        public static bool IsAuthenticated() {
            return GetLoggedInUserInfo() != null;
        }

        public static ApplicationUserModel GetLoggedInUserInfo() {
            return HttpContext.Current.Session["User"] as ApplicationUserModel;
        }
        private static ApplicationUserModel CreateDefualtUser() {
            return new ApplicationUserModel {
                UserName = "X",
                Email = "julia.bell@example.com",
                AvatarUrl = "~/Content/Photo/Julia_Bell.jpg"
            };
        }
    }
}