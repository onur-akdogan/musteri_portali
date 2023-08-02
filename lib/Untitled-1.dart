Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      'Tahmini Tüketim',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      'Tüketim miktarlarınızı görebilirsiniz',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownButton<String>(
                    items: [
                      DropdownMenuItem(
                        child: Text('Ankara'),
                        value: 'Ankara',
                      ),
                      DropdownMenuItem(
                        child: Text('İstanbul'),
                        value: 'İstanbul',
                      ),
                      DropdownMenuItem(
                        child: Text('Bolu'),
                        value: 'Bolu',
                      ),
                      DropdownMenuItem(
                        child: Text('Mersin'),
                        value: 'Mersin',
                      ),
                      DropdownMenuItem(
                        child: Text('Kayseri'),
                        value: 'Kayseri',
                      ),
                    ],
                    onChanged: (selectedStation) {},
                    hint: const Text(
                        'İstasyon Seçin'), // Başlangıçta görünen metin
                    isExpanded: true, // Menünün genişlemesini sağlar
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Radio(
                        value: 'ST',
                        groupValue: 'radioGroup',
                        onChanged: (value) {
                          // Seçilen değeri almak için bir fonksiyon
                          // Burada seçilen radio buton değerini kullanabilirsiniz.
                        },
                      ),
                      Text('ST'),
                      Radio(
                        value: 'ABN',
                        groupValue: 'radioGroup',
                        onChanged: (value) {
                          // Seçilen değeri almak için bir fonksiyon
                          // Burada seçilen radio buton değerini kullanabilirsiniz.
                        },
                      ),
                      const Text('ABN'),
                      Radio(
                        value: 'ELK',
                        groupValue: 'radioGroup',
                        onChanged: (value) {
                          // Seçilen değeri almak için bir fonksiyon
                          // Burada seçilen radio buton değerini kullanabilirsiniz.
                        },
                      ),
                      const Text('ELK'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 40)),
                    onPressed: () {
                      // Tarih seçiciyi açmak için bir fonksiyon çağırabilirsiniz.
                    },
                    child: const Text(
                      'Tarih Seçin',
                      style: TextStyle(fontFamily: 'poppins'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Seçilen Tarih: 31 Ağustos 2023', // Örnek tarih, seçilen tarih ile değiştirilecek
                    style: TextStyle(fontSize: 16, fontFamily: 'poppins'),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Gerçekleşen Miktar',
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Gerçekleşen Miktar',
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _showMessage(context);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        minimumSize: Size(double.infinity, 40)),
                    child: const Text('Miktar Girişi Kaydet'),
                  ),
                ],
              ),
            ),
          ),
          