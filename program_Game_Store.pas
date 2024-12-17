program Game_Store;
uses crt;

type
    // Mendefinisikan tipe data record untuk menyimpan informasi game
    TGame = record
        nama: string; // Nama game
        harga: longint; // Harga game
    end;

const
    MAX_GAME = 10; // Konstanta untuk jumlah maksimum game

var
    daftarGame: array[1..MAX_GAME] of TGame; // Array untuk menyimpan daftar game
    totalHarga: longint; 
    uang: longint; 
    pilihan: string; 
    jumlah: integer; 
    i: integer; 
    belilagi: char; 
    gameDitemukan: boolean; // Flag untuk menandakan apakah game ditemukan

procedure InitDaftarGame;
begin
    // Menginisialisasi daftar game dengan nama dan harga
    daftarGame[1].nama := 'Resident Evil 4 Remake             '; daftarGame[1].harga := 100000;
    daftarGame[2].nama := 'Need For Speed 2024                '; daftarGame[2].harga := 150000;
    daftarGame[3].nama := 'Grand Theft Auto VI                '; daftarGame[3].harga := 200000;
    daftarGame[4].nama := 'College Football 25                '; daftarGame[4].harga := 250000;
    daftarGame[5].nama := 'Spider-Man: Miles Morales          '; daftarGame[5].harga := 300000;
    daftarGame[6].nama := 'Resident Evil Village              '; daftarGame[6].harga := 350000;
    daftarGame[7].nama := 'Demon Souls                        '; daftarGame[7].harga := 400000;
    daftarGame[8].nama := 'Grand Theft Auto V                 '; daftarGame[8].harga := 450000;
    daftarGame[9].nama := 'Final Fantasy VII Remake Intergrade'; daftarGame[9].harga := 500000;
    daftarGame[10].nama := 'NBA 2K25                          '; daftarGame[10].harga := 550000;
end;

function TotalPembayaran(namaGame: string; jumlah: integer): longint; 
var
    total: longint; // Variabel untuk menyimpan total harga
    i: integer; // Variabel iterator untuk looping
begin
    total := 0; // Inisialisasi total dengan 0
    for i := 1 to MAX_GAME do // Looping untuk mencari game dalam daftar
    begin
        if daftarGame[i].nama = namaGame then // Cek apakah nama game cocok
        begin              
            total := daftarGame[i].harga * jumlah; // Hitung total harga
            break; // Keluar dari loop jika game ditemukan
        end;
    end;
    TotalPembayaran := total; // Mengembalikan total harga
end;

function RemoveTrailingSpaces(s: string): string;
var
    i: integer; 
begin
    i := Length(s); // Mendapatkan panjang string
    while (i > 0) and (s[i] = ' ') do // Menghapus spasi di akhir string
        Dec(i); // Mengurangi indeks
    SetLength(s, i); // Mengatur panjang string baru
    RemoveTrailingSpaces := s; // Mengembalikan string tanpa spasi
end;

begin
    clrscr; // Membersihkan layar
    InitDaftarGame; // Memanggil procedure untuk menginisialisasi daftar game
    writeln('Selamat datang di El-Coders Game Store!');
    
    repeat // Looping untuk proses pembelian
        writeln('Daftar Game Terbaru:');
        writeln('=======================================================');
        for i := 1 to MAX_GAME do // Looping untuk menampilkan daftar game
        begin
            writeln(i, '. ', daftarGame[i].nama, ' - Rp. ', daftarGame[i].harga);
        end;

        totalHarga := 0; // Reset total harga
        gameDitemukan := false; // Reset flag game ditemukan
        writeln('=======================================================');
        write('Game ingin dibeli        : ');
        readln(pilihan); // Membaca input game yang ingin dibeli
        
        // Cek apakah game ada di daftar
        for i := 1 to MAX_GAME do // Looping untuk mencari game
        begin
            if RemoveTrailingSpaces(daftarGame [i].nama) = RemoveTrailingSpaces(pilihan) then // Cek apakah nama game cocok
            begin
                gameDitemukan := true; // Tandai bahwa game ditemukan
                write('Jumlah game ingin dibeli : ');
                readln(jumlah); // Membaca jumlah game yang ingin dibeli
                writeln;
                totalHarga := TotalPembayaran(daftarGame[i].nama, jumlah); // Hitung total harga
                break; // Keluar dari loop jika game ditemukan
            end;
        end;

        if not gameDitemukan then // Jika game tidak ditemukan
        begin
            writeln('Game tidak ditemukan. Silakan coba lagi.'); // Tampilkan pesan kesalahan
            continue; // Kembali ke awal loop
        end;

        writeln('Rincian Pembelian');
        writeln('Game        : ', pilihan); // Tampilkan rincian pembelian
        writeln('Jumlah      : ', jumlah);
        writeln('Total Harga : Rp.', totalHarga);
        
        write('Masukkan uang yang anda masukkan (uang harus pas) : ');
        readln(uang); // Membaca uang yang dimasukkan oleh pengguna
        
        if uang < totalHarga then // Jika uang kurang dari total harga
            writeln('Maaf, uang anda yang dimasukkan tidak cukup.') // Tampilkan pesan kesalahan
        else if uang > totalHarga then // Jika uang lebih dari total harga
            writeln('Uang yang anda masukkan harus pas.') // Tampilkan pesan kesalahan
        else
            writeln('Pembelian berhasil! Terima kasih telah berbelanja.'); // Tampilkan pesan sukses

        write('Apakah anda ingin membeli lagi? Pilih(Y/N) : ');
        readln(belilagi); // Membaca input untuk menanyakan apakah ingin membeli lagi
    until (belilagi in ['N', 'n']); // Ulangi hingga pengguna memilih untuk tidak membeli lagi
    
    writeln('Terima kasih telah berkunjung ke Game Store!'); // Tampilkan pesan terima kasih
end.
