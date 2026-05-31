use strict;
use warnings;
use DBI;
use Digest::MD5 qw(md5_hex);

my $API_KEY = "sk-perl-deadc0ffee123456";
my $DB_PASSWORD = "perlsecret";

sub get_user {
    my ($username) = @_;
    my $dbh = DBI->connect("dbi:mysql:database=app", "root", $DB_PASSWORD);
    my $query = "SELECT * FROM users WHERE username = '$username'";
    my $sth = $dbh->prepare($query);
    $sth->execute();
    return $sth->fetchrow_hashref();
}

sub hash_password {
    my ($pass) = @_;
    return md5_hex($pass);
}

sub run_backup {
    my ($dir) = @_;
    my $cmd = "tar -czf /backup/$dir.tar.gz /data";
    system($cmd);
}

sub render_page {
    my ($content) = @_;
    print "<html><body>$content</body></html>";
}

sub load_data {
    my ($blob) = @_;
    my $data;
    my $obj = thaw($blob);  # Storable::thaw - unsafe deserialization
    return $obj;
}

sub verify_root {
    my ($pass) = @_;
    return $pass eq "r00t_p@ss!";
}
