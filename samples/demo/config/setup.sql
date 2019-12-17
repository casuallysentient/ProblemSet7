DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
	user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    account_type TEXT NOT NULL,
    username TEXT UNIQUE NOT NULL,
    auth TEXT NOT NULL,
    last_login TEXT NOT NULL
);

INSERT INTO users (account_type, username, auth, last_login) VALUES ("root", "root", "b4b8daf4b8ea9d39568719e1e320076f", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("administrator", "cgialanella", "f40a411b75ccdabe32fa77799b505ed2", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("administrator", "pdifrancesco", "db72bc4ee8223c105c3181f3a1d297ca", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("teacher", "rwilson", "30cceb48c348719f0c2f483a54151b27", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("teacher", "mcohen", "fdd80a523b36a74124c3baaa399eeebd", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("teacher", "psavage", "e73889caa87de7d0e683310f8027db57", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("teacher", "lmiranda", "714daa8e1c680954f70f57bd0f7febe8", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("teacher", "tdelmonaco", "4851f64bf732d24007cde02ec7350dcb", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("teacher", "acolasanti", "0a98a598e440bc41064a073a3661563e", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "lbetancur", "59972b7c60ad14e3288603272fc7a22a", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "jblechinger-slocum", "c2540a118ca6222bb475e9d55f03dcd9", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "kcheung", "26d816a34e8c88a536a86a1980d37668", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "ngiron", "d204c657e6d232be284c0205a443740d", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "jgoceljak", "37da7e6cab154f6402061461ae111fdf", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "egranville", "4b5bd209c1700095ec9845a66d774139", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "mman", "e53633d18f2bc12cf943963842a1a9c8", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "smazza", "a66f9100e2863e8bfa8124afbe5579f2", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "aneuhaus", "b078393d9b75226c48fd2d077e0bf054", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "mrago", "1aebf32035aad90cf4fb9d5d579314e7", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "jriascos", "3f6f202d13f770b737028d96fc6d083b", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "drogers", "3215261f46ea5bca9a86d53303aa8c4e", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "cterzo", "063ff4dd93008ec3f78af6ee908cd8aa", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "cvasquez", "41ae9e98d0036add2daee38320f8adb9", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "dvaykhanskiy", "851c9b5425e9b070a93a8ad00ea729a0", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "jwalsh", "5a21c37f7d562c603b0cbc73c9c3f61d", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "jwang", "c3808a6ac0fa71e0ae13c2b77b9a6c0c", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "nchahil", "bb5398f15cc0ef8550bd43b2f8e8c50e", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "sdwivedi", "a7c531b356d9c034de333cad56a4fb10", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "tfinnerty", "130f07b5241e318fc98fb5575d64fef3", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "rford", "ae5db4090e52b9017b25a0b465c9700a", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "hgarg", "eb01b272d0bba13667e6b2e9bdd7fcb2", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "kgoetke", "7c8659c7dfaa9eefcfb6503f1f63976a", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "ngoodman", "8cd0096a7b78873475556b402cd8ac39", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "chogge", "411ce44c61de4d0e9861643c7a5c6bcd", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "ahuang", "60e57155f48724808ba879c15e8b4161", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "mmoore", "c9141a563138dff46edc3a54cb06b316", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "aravishankar", "8ca28444c999012dd078e427eefd9cb8", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "arodriguez", "1dbf7455691470844dd9ef4fdf05c96e", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "mryan", "30ecd0e45a1bb0d440edda7087333b01", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "pahang", "def1841fb7be774bc28c975f64377024", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "zbashay", "a4b7dac1177f71f10e962fdff11eb9ec", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "agiankouros", "22d8ded6d39a0b6ff4817eea68e1d03a", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "jgiglio", "7781fdf2a8d025bc01d56556eb3447c4", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "gguzman", "ad915df7b09a6017a0b191d497b7ae7d", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "divanov", "4c5a874cc2e12ce8b64ed1c72507c414", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "dlevine", "bc3b0dc9385972731d3454bace57c41b", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "alopez", "714a209562eb9bf9a84bebac323c2f12", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "kmaselli", "b9c211434029d8a6d82fc6431154cd50", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "rprokap", "def00b80df7bd779f3a0a420750e4ba7", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "ksivaneri", "c4674ddb11ccaaa6bb45d1532b2f2a89", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "durena", "a9d6157784ce3a9575fef3edc6681fa5", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "axi", "c6b5ad21092766de99174f9581c4ff3c", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "jyang", "e6043e588f57eedbee267a423307cae4", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "izheng", "b1ff65ce28d5c9395ba61ea79ec0a146", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "scadet", "3a2487a32c4abff88801a964fd6b50d5", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "kcamia", "13d9306e051bea4ee75dcb3ea7712047", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "echarles", "bfb0850378a5fb1d199b8c8a90faf937", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "odesai", "941e6153d31fd9cd5d0d2bc688ef3616", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "demmanuel", "6e71feaad303fac36a504497c0043e67", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "afazio", "54f68bdf5f106774d164dd595175b2b0", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "vfunez", "eaddcb853cc8c4abaac95f3b3fd70e3d", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "ogolec", "fc788c04151a501e4a1deb90dc447a86", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "aknight", "a751a6e35dfad871b62d2322bd07b6de", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "jlin", "1e0e88ca8df3b99b65f01ec390c7c4be", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "lmikulenas", "c7fe4ceb735e8217c310319f240bf893", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "eojo", "bfce5e79525697ca1337e1bc5a248681", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "srosales", "f39f20323653ac36fcad36a59af7a0ae", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "mshafer", "7943c3020de731b887ceed973448708c", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "gweiner", "ba769095f9737378e6fc8dac843c7738", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "bfiallos", "a4fd6ce097ffcfc9948ba0939c7d22bb", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "gghoda", "76e9e59de9f8f9aad78c17dfd8776418", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "mhui", "911fd2df9c2276d2240a108baf890be7", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "jjenkins", "3d3d82473710155249e6118eb48a56fe", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "dkang", "050e7659f09b86f90833d8db33ba0597", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "nmonga", "05b713418d1b4cdfd0c5a126a078f2a8", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "amooney", "7378909bda551430b8d1ab0f803c761b", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "ing", "44468cd93cdfefb8a7f911b5e1f7dfd0", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "zoliver", "fccfd5fc96580af379e2be36261e6d3b", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "asantos", "8b934020979de12cadf57c559feef063", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "mstaunton", "d975db5b3602af31cca4db82ab053b71", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "ixiong", "265b2119b3b6908bbaf0af2dda36f14c", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "bcarpenter", "1aff3d35ce0597a63a9e7a6f4819b115", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "jchan", "0275ffbf13c575cf9b31932987e7fe58", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "ncu", "ad90edc01b426413e9c274a3d6e3bcd0", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "aforrester", "77eed3dc05b15762c1d13a81682f8e6a", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "agandhi", "e42e163ba2c9d6ec479b360edf6268fd", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "agonzalez", "3835f6b8f1e067fda3141d2142a04fe1", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "jgoytia", "6f032928b804f4dd3bfd16708da26398", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "ehalliday", "3284303b46735ed38130f2b87ab01c38", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "sjoseph", "f851108c86635035147808cb05afef11", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "nneuhaus", "81294e1c2e1ab14fd176d34de40eeb1b", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "inunez", "0089cb9219fb54b9fb6f5efbea2d9b63", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "losiecki", "5d631acba443f64e5dbb7b0deb1ed717", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "msarton", "013dd56bffa32c76914afb514af5008d", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "mshriner", "7695de56fd0e7f49bf3416d9a8487c57", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "ksuarez", "7d352776f40d99025c34eabfc79e039f", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "rtakenaga", "9c82aee8ce44068b9e7b7ebb5707005a", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "gvalentin", "0f3c83cfc31f007bc64dd3f02f1aaa39", "0000-00-00 00:00:00.000");
INSERT INTO users (account_type, username, auth, last_login) VALUES ("student", "ayu", "ef7cc633549a95246354cccecd7b8c9e", "0000-00-00 00:00:00.000");

DROP TABLE IF EXISTS departments;
CREATE TABLE IF NOT EXISTS departments (
	department_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT UNIQUE NOT NULL
);

INSERT INTO departments (title) VALUES ("Computer Science");
INSERT INTO departments (title) VALUES ("English");
INSERT INTO departments (title) VALUES ("History");
INSERT INTO departments (title) VALUES ("Mathematics");
INSERT INTO departments (title) VALUES ("Physical Education");
INSERT INTO departments (title) VALUES ("Science");

DROP TABLE IF EXISTS administrators;
CREATE TABLE IF NOT EXISTS administrators (
	administrator_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    job_title TEXT NOT NULL,
    user_id INTEGER UNIQUE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

INSERT INTO administrators (first_name, last_name, job_title, user_id) VALUES ("Colleen", "Gialanella", "Principal", 2);
INSERT INTO administrators (first_name, last_name, job_title, user_id) VALUES ("Paul", "DiFrancesco", "Supervisor", 3);

DROP TABLE IF EXISTS teachers;
CREATE TABLE IF NOT EXISTS teachers (
	teacher_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    department_id INTEGER NOT NULL,
    user_id INTEGER UNIQUE NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments (department_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

INSERT INTO teachers (first_name, last_name, department_id, user_id) VALUES ("Ryan", "Wilson", 1, 4);
INSERT INTO teachers (first_name, last_name, department_id, user_id) VALUES ("Moriah", "Cohen", 2, 5);
INSERT INTO teachers (first_name, last_name, department_id, user_id) VALUES ("Savage", "Paul", 3, 6);
INSERT INTO teachers (first_name, last_name, department_id, user_id) VALUES ("Lawrence", "Miranda", 4, 7);
INSERT INTO teachers (first_name, last_name, department_id, user_id) VALUES ("Tara", "Delmonaco", 5, 8);
INSERT INTO teachers (first_name, last_name, department_id, user_id) VALUES ("Andrew", "Colasanti", 6, 9);

DROP TABLE IF EXISTS students;
CREATE TABLE IF NOT EXISTS students (
	student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    graduation INTEGER NOT NULL,
    grade_level INTEGER NOT NULL,
    gpa REAL NOT NULL,
    class_rank INTEGER NOT NULL,
    user_id INTEGER UNIQUE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Lukas", "Betancur", 2019, 12, -1.0, 0, 10);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Jaedan", "Blechinger-Slocum", 2019, 12, -1.0, 0, 11);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Kyle", "Cheung", 2019, 12, -1.0, 0, 12);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Nicole", "Giron", 2019, 12, -1.0, 0, 13);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("John", "Goceljak", 2019, 12, -1.0, 0, 14);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Emily", "Granville", 2019, 12, -1.0, 0, 15);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Matthew", "Man", 2019, 12, -1.0, 0, 16);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Stephen", "Mazza", 2019, 12, -1.0, 0, 17);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Andrew", "Neuhaus", 2019, 12, -1.0, 0, 18);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Matthias", "Rago", 2019, 12, -1.0, 0, 19);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Joseph", "Riascos", 2019, 12, -1.0, 0, 20);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("David", "Rogers", 2019, 12, -1.0, 0, 21);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Corvin", "Terzo", 2019, 12, -1.0, 0, 22);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Carlos", "Vasquez", 2019, 12, -1.0, 0, 23);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("David", "Vaykhanskiy", 2019, 12, -1.0, 0, 24);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Jack", "Walsh", 2019, 12, -1.0, 0, 25);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Joseph", "Wang", 2019, 12, -1.0, 0, 26);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Neil", "Chahil", 2019, 12, -1.0, 0, 27);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Sambhavi", "Dwivedi", 2019, 12, -1.0, 0, 28);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Thomas", "Finnerty", 2019, 12, -1.0, 0, 29);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Reilly", "Ford", 2019, 12, -1.0, 0, 30);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Harshita", "Garg", 2019, 12, -1.0, 0, 31);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Kyle", "Goetke", 2019, 12, -1.0, 0, 32);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Naya-Jevan", "Goodman", 2019, 12, -1.0, 0, 33);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Christopher", "Hogge", 2019, 12, -1.0, 0, 34);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Amy", "Huang", 2019, 12, -1.0, 0, 35);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Michael", "Moore", 2019, 12, -1.0, 0, 36);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Aryan", "Ravishankar", 2019, 12, -1.0, 0, 37);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Andrew", "Rodriguez", 2019, 12, -1.0, 0, 38);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Michael", "Ryan", 2019, 12, -1.0, 0, 39);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Paniz", "Ahang", 2021, 10, -1.0, 0, 40);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Zaviay", "Bashay", 2021, 10, -1.0, 0, 41);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Alexander", "Giankouros", 2021, 10, -1.0, 0, 42);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("John", "Giglio", 2021, 10, -1.0, 0, 43);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Grissel", "Guzman", 2021, 10, -1.0, 0, 44);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Daniel", "Ivanov", 2021, 10, -1.0, 0, 45);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("David", "Levine", 2021, 10, -1.0, 0, 46);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Andy", "Lopez", 2021, 10, -1.0, 0, 47);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Kaela", "Maselli", 2021, 10, -1.0, 0, 48);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Rachael", "Prokap", 2021, 10, -1.0, 0, 49);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Keeran", "Sivaneri", 2021, 10, -1.0, 0, 50);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Daneliz", "Urena", 2021, 10, -1.0, 0, 51);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Alina", "Xi", 2021, 10, -1.0, 0, 52);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Jun", "Yang", 2021, 10, -1.0, 0, 53);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Ivan", "Zheng", 2021, 10, -1.0, 0, 54);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Sarah", "Cadet", 2021, 10, -1.0, 0, 55);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Kristina", "Camia", 2021, 10, -1.0, 0, 56);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Ethan", "Charles", 2021, 10, -1.0, 0, 57);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Om", "Desai", 2021, 10, -1.0, 0, 58);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Daniel", "Emmanuel", 2021, 10, -1.0, 0, 59);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Alexa", "Fazio", 2021, 10, -1.0, 0, 60);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Vanya", "Funez", 2021, 10, -1.0, 0, 61);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Olivia", "Golec", 2021, 10, -1.0, 0, 62);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Angelia", "Knight", 2021, 10, -1.0, 0, 63);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Jessica", "Lin", 2021, 10, -1.0, 0, 64);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Lukas", "Mikulenas", 2021, 10, -1.0, 0, 65);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Elijah", "Ojo", 2021, 10, -1.0, 0, 66);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Sarah", "Rosales", 2021, 10, -1.0, 0, 67);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Micah", "Shafer", 2021, 10, -1.0, 0, 68);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Gabrielle", "Weiner", 2021, 10, -1.0, 0, 69);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Bryant", "Fiallos", 2021, 10, -1.0, 0, 70);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Gyan", "Ghoda", 2021, 10, -1.0, 0, 71);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Matthew", "Hui", 2021, 10, -1.0, 0, 72);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Jordan", "Jenkins", 2021, 10, -1.0, 0, 73);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Danielle", "Kang", 2021, 10, -1.0, 0, 74);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Nirayka", "Mongo", 2021, 10, -1.0, 0, 75);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Aidan", "Mooney", 2021, 10, -1.0, 0, 76);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Ivy", "Ng", 2021, 10, -1.0, 0, 77);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Zoe", "Oliver", 2021, 10, -1.0, 0, 78);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Afonso", "Santos", 2021, 10, -1.0, 0, 79);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Michael", "Staunton", 2021, 10, -1.0, 0, 80);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Isabella", "Xiong", 2021, 10, -1.0, 0, 81);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Benjamin", "Carpenter", 2021, 10, -1.0, 0, 82);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Joshua", "Chan", 2021, 10, -1.0, 0, 83);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Cu", "Ngoc-Nhi", 2021, 10, -1.0, 0, 84);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Aidan", "Forrester", 2021, 10, -1.0, 0, 85);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Ansh", "Gandhi", 2021, 10, -1.0, 0, 86);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Alina", "Gonzalez", 2021, 10, -1.0, 0, 87);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("John", "Goytia", 2021, 10, -1.0, 0, 88);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Ellis", "Halliday", 2021, 10, -1.0, 0, 89);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Sebastian", "Joseph", 2021, 10, -1.0, 0, 90);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Nathalie", "Neuhaus", 2021, 10, -1.0, 0, 91);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Isaiah", "Nunez", 2021, 10, -1.0, 0, 92);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Lucas", "Osiecki", 2021, 10, -1.0, 0, 93);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Molly", "Sarton", 2021, 10, -1.0, 0, 94);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Michael", "Shriner", 2021, 10, -1.0, 0, 95);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Kevin", "Suarez", 2021, 10, -1.0, 0, 96);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Ryoma", "Takenaga", 2021, 10, -1.0, 0, 97);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Grace", "Valentin", 2021, 10, -1.0, 0, 98);
INSERT INTO students (first_name, last_name, graduation, grade_level, gpa, class_rank, user_id) VALUES ("Alexander", "Yu", 2021, 10, -1.0, 0, 99);

DROP TABLE IF EXISTS courses;
CREATE TABLE IF NOT EXISTS courses (
	course_id INTEGER PRIMARY KEY AUTOINCREMENT,
    department_id INTEGER NOT NULL,
    teacher_id INTEGER NOT NULL,
    course_no TEXT UNIQUE NOT NULL,
    title TEXT UNIQUE NOT NULL,
    credit_hours REAL NOT NULL,
    weight REAL NOT NULL,
    enrollment INTEGER NOT NULL,
    capacity INTEGER NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments (department_id),
    FOREIGN KEY (teacher_id) REFERENCES teachers (teacher_id)
);

INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (1, 1, "CS1000", "Computer Applications in Business", 5.0, 1.0, 0, 100);
INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (1, 1, "CS2000", "AP Computer Science Principles", 5.0, 1.5, 0, 100);
INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (1, 1, "CS3000", "Database Management", 5.0, 1.0, 0, 50);
INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (1, 1, "CS4000", "AP Computer Science A", 5.0, 1.5, 0, 50);
INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (2, 2, "EN1000", "English I", 5.0, 1.0, 0, 100);
INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (2, 2, "EN2000", "English II", 5.0, 1.0, 0, 100);
INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (2, 2, "EN3000", "AP English Language and Composition", 5.0, 1.5, 0, 50);
INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (2, 2, "EN4000", "AP English Literature and Composition", 5.0, 1.5, 0, 50);
INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (3, 3, "HI1000", "World History", 5.0, 1.0, 0, 100);
INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (3, 3, "HI2000", "U.S. History I", 5.0, 1.0, 0, 100);
INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (3, 3, "HI3000", "U.S. History II", 5.0, 1.0, 0, 100);
INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (3, 3, "HI4000", "AP United States History", 5.0, 1.5, 0, 50);
INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (4, 4, "MA1000", "Combined Algebra", 5.0, 1.0, 0, 100);
INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (4, 4, "MA2000", "Geometry and Trigonometry", 5.0, 1.0, 0, 100);
INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (4, 4, "MA3000", "Math Analysis", 5.0, 1.0, 0, 100);
INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (4, 4, "MA4000", "AP Calculus AB", 5.0, 1.5, 0, 50);
INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (5, 5, "PE1000", "Fitness I", 5.0, 1.0, 0, 100);
INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (5, 5, "PE2000", "Fitness II", 5.0, 1.0, 0, 100);
INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (5, 5, "PE3000", "Fitness III", 5.0, 1.0, 0, 100);
INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (5, 5, "PE4000", "Fitness IV", 5.0, 1.0, 0, 100);
INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (6, 6, "SC1000", "Biology", 5.0, 1.0, 0, 100);
INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (6, 6, "SC2000", "Chemistry", 5.0, 1.0, 0, 100);
INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (6, 6, "SC3000", "Physics", 5.0, 1.0, 0, 100);
INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (6, 6, "SC4100", "AP Biology", 5.0, 1.5, 0, 50);
INSERT INTO courses (department_id, teacher_id, course_no, title, credit_hours, weight, enrollment, capacity) VALUES (6, 6, "SC4200", "AP Chemistry", 5.0, 1.5, 0, 50);

DROP TABLE IF EXISTS course_grades;
CREATE TABLE IF NOT EXISTS course_grades (
	course_id INTEGER NOT NULL,
	student_id INTEGER NOT NULL,
	mp1 REAL,
    mp2 REAL,
    midterm_exam REAL,
    mp3 REAL,
    mp4 REAL,
    final_exam REAL,
    grade REAL,
    FOREIGN KEY (course_id) REFERENCES courses (course_id),
    FOREIGN KEY (student_id) REFERENCES students (student_id),
    PRIMARY KEY (course_id, student_id)
);

INSERT INTO course_grades (course_id, student_id) VALUES (4, 1);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 2);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 3);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 4);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 5);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 6);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 7);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 8);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 9);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 10);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 11);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 12);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 13);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 14);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 15);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 16);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 17);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 18);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 19);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 20);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 21);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 22);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 23);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 24);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 25);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 26);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 27);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 28);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 29);
INSERT INTO course_grades (course_id, student_id) VALUES (4, 30);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 1);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 2);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 3);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 4);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 5);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 6);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 7);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 8);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 9);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 10);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 11);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 12);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 13);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 14);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 15);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 16);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 17);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 18);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 19);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 20);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 21);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 22);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 23);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 24);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 25);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 26);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 27);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 28);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 29);
INSERT INTO course_grades (course_id, student_id) VALUES (8, 30);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 1);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 2);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 3);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 4);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 5);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 6);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 7);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 8);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 9);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 10);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 11);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 12);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 13);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 14);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 15);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 16);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 17);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 18);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 19);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 20);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 21);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 22);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 23);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 24);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 25);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 26);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 27);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 28);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 29);
INSERT INTO course_grades (course_id, student_id) VALUES (12, 30);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 1);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 2);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 3);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 4);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 5);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 6);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 7);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 8);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 9);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 10);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 11);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 12);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 13);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 14);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 15);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 16);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 17);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 18);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 19);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 20);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 21);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 22);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 23);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 24);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 25);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 26);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 27);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 28);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 29);
INSERT INTO course_grades (course_id, student_id) VALUES (16, 30);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 1);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 2);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 3);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 4);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 5);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 6);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 7);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 8);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 9);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 10);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 11);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 12);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 13);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 14);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 15);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 16);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 17);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 18);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 19);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 20);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 21);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 22);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 23);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 24);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 25);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 26);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 27);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 28);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 29);
INSERT INTO course_grades (course_id, student_id) VALUES (20, 30);
INSERT INTO course_grades (course_id, student_id) VALUES (24, 1);
INSERT INTO course_grades (course_id, student_id) VALUES (24, 3);
INSERT INTO course_grades (course_id, student_id) VALUES (24, 5);
INSERT INTO course_grades (course_id, student_id) VALUES (24, 7);
INSERT INTO course_grades (course_id, student_id) VALUES (24, 9);
INSERT INTO course_grades (course_id, student_id) VALUES (24, 11);
INSERT INTO course_grades (course_id, student_id) VALUES (24, 13);
INSERT INTO course_grades (course_id, student_id) VALUES (24, 15);
INSERT INTO course_grades (course_id, student_id) VALUES (24, 17);
INSERT INTO course_grades (course_id, student_id) VALUES (24, 19);
INSERT INTO course_grades (course_id, student_id) VALUES (24, 21);
INSERT INTO course_grades (course_id, student_id) VALUES (24, 23);
INSERT INTO course_grades (course_id, student_id) VALUES (24, 25);
INSERT INTO course_grades (course_id, student_id) VALUES (24, 27);
INSERT INTO course_grades (course_id, student_id) VALUES (24, 29);
INSERT INTO course_grades (course_id, student_id) VALUES (25, 2);
INSERT INTO course_grades (course_id, student_id) VALUES (25, 4);
INSERT INTO course_grades (course_id, student_id) VALUES (25, 6);
INSERT INTO course_grades (course_id, student_id) VALUES (25, 8);
INSERT INTO course_grades (course_id, student_id) VALUES (25, 10);
INSERT INTO course_grades (course_id, student_id) VALUES (25, 12);
INSERT INTO course_grades (course_id, student_id) VALUES (25, 14);
INSERT INTO course_grades (course_id, student_id) VALUES (25, 16);
INSERT INTO course_grades (course_id, student_id) VALUES (25, 18);
INSERT INTO course_grades (course_id, student_id) VALUES (25, 20);
INSERT INTO course_grades (course_id, student_id) VALUES (25, 22);
INSERT INTO course_grades (course_id, student_id) VALUES (25, 24);
INSERT INTO course_grades (course_id, student_id) VALUES (25, 26);
INSERT INTO course_grades (course_id, student_id) VALUES (25, 28);
INSERT INTO course_grades (course_id, student_id) VALUES (25, 30);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 31);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 32);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 33);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 34);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 35);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 36);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 37);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 38);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 39);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 40);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 41);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 42);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 43);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 44);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 45);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 46);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 47);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 48);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 49);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 50);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 51);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 52);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 53);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 54);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 55);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 56);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 57);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 58);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 59);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 60);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 61);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 62);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 63);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 64);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 65);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 66);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 67);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 68);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 69);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 70);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 71);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 72);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 73);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 74);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 75);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 76);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 77);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 78);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 79);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 80);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 81);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 82);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 83);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 84);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 85);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 86);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 87);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 88);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 89);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 90);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 91);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 92);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 93);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 94);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 95);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 96);
INSERT INTO course_grades (course_id, student_id) VALUES (2, 97);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 31);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 32);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 33);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 34);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 35);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 36);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 37);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 38);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 39);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 40);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 41);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 42);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 43);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 44);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 45);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 46);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 47);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 48);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 49);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 50);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 51);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 52);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 53);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 54);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 55);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 56);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 57);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 58);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 59);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 60);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 61);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 62);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 63);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 64);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 65);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 66);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 67);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 68);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 69);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 70);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 71);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 72);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 73);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 74);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 75);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 76);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 77);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 78);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 79);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 80);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 81);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 82);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 83);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 84);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 85);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 86);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 87);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 88);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 89);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 90);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 91);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 92);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 93);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 94);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 95);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 96);
INSERT INTO course_grades (course_id, student_id) VALUES (6, 97);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 31);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 32);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 33);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 34);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 35);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 36);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 37);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 38);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 39);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 40);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 41);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 42);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 43);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 44);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 45);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 46);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 47);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 48);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 49);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 50);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 51);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 52);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 53);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 54);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 55);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 56);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 57);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 58);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 59);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 60);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 61);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 62);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 63);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 64);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 65);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 66);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 67);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 68);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 69);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 70);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 71);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 72);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 73);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 74);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 75);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 76);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 77);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 78);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 79);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 80);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 81);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 82);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 83);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 84);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 85);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 86);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 87);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 88);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 89);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 90);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 91);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 92);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 93);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 94);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 95);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 96);
INSERT INTO course_grades (course_id, student_id) VALUES (10, 97);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 31);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 32);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 33);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 34);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 35);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 36);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 37);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 38);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 39);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 40);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 41);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 42);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 43);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 44);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 45);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 46);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 47);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 48);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 49);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 50);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 51);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 52);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 53);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 54);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 55);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 56);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 57);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 58);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 59);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 60);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 61);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 62);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 63);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 64);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 65);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 66);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 67);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 68);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 69);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 70);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 71);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 72);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 73);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 74);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 75);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 76);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 77);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 78);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 79);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 80);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 81);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 82);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 83);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 84);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 85);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 86);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 87);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 88);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 89);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 90);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 91);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 92);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 93);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 94);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 95);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 96);
INSERT INTO course_grades (course_id, student_id) VALUES (14, 97);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 31);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 32);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 33);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 34);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 35);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 36);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 37);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 38);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 39);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 40);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 41);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 42);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 43);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 44);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 45);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 46);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 47);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 48);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 49);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 50);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 51);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 52);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 53);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 54);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 55);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 56);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 57);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 58);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 59);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 60);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 61);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 62);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 63);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 64);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 65);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 66);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 67);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 68);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 69);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 70);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 71);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 72);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 73);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 74);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 75);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 76);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 77);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 78);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 79);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 80);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 81);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 82);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 83);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 84);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 85);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 86);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 87);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 88);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 89);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 90);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 91);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 92);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 93);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 94);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 95);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 96);
INSERT INTO course_grades (course_id, student_id) VALUES (18, 97);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 31);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 32);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 33);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 34);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 35);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 36);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 37);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 38);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 39);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 40);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 41);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 42);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 43);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 44);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 45);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 46);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 47);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 48);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 49);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 50);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 51);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 52);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 53);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 54);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 55);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 56);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 57);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 58);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 59);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 60);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 61);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 62);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 63);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 64);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 65);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 66);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 67);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 68);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 69);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 70);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 71);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 72);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 73);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 74);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 75);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 76);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 77);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 78);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 79);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 80);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 81);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 82);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 83);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 84);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 85);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 86);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 87);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 88);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 89);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 90);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 91);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 92);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 93);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 94);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 95);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 96);
INSERT INTO course_grades (course_id, student_id) VALUES (22, 97);

DROP TABLE IF EXISTS assignments;
CREATE TABLE IF NOT EXISTS assignments (
	course_id INTEGER NOT NULL,
    assignment_id INTEGER NOT NULL,
    marking_period INTEGER NOT NULL,
    is_midterm INTEGER NOT NULL,
    is_final INTEGER NOT NULL,
    title TEXT NOT NULL,
    point_value INTEGER NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses (course_id),
    PRIMARY KEY (course_id, assignment_id, marking_period, title)
);

DROP TABLE IF EXISTS assignment_grades;
CREATE TABLE IF NOT EXISTS assignment_grades (
	course_id INTEGER NOT NULL,
    assignment_id INTEGER NOT NULL,
    student_id INTEGER NOT NULL,
    points_earned INTEGER,
    points_possible INTEGER NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses (course_id),
    FOREIGN KEY (assignment_id) REFERENCES assignemnts (assignment_id),
    FOREIGN KEY (student_id) REFERENCES students (student_id),
    PRIMARY KEY (course_id, assignment_id, student_id)
);
