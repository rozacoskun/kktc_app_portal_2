import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CarSearchFiltersScreen extends StatefulWidget {
  final int year;
  final String brand;
  final String category;

  const CarSearchFiltersScreen({
    super.key,
    required this.year,
    required this.brand,
    required this.category,
  });

  @override
  State<CarSearchFiltersScreen> createState() => _CarSearchFiltersScreenState();
}

class _CarSearchFiltersScreenState extends State<CarSearchFiltersScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, List<String>> _districts = {
    'Lefkoşa': ['Gönyeli', 'Alayköy', 'Haspolat', 'Dikmen', 'Surlariçi', 'Küçük Kaymaklı', 'Göçmenköy', 'Kızılbaş', 'Taşkınköy', 'Yenişehir', 'Hamitköy'],
    'Gazimağusa': ['Suriçi', 'Maraş', 'Sakarya', 'Karakol', 'Yeni Boğaziçi', 'Akdoğan', 'Dörtyol', 'Türkmenköy'],
    'Girne': ['Alsancak', 'Arapköy', 'Bahçeli', 'Beylerbeyi', 'Çatalköy', 'Esentepe', 'Girne', 'Lapta', 'Ozanköy'],
    'Güzelyurt': ['Güzelyurt (merkez)', 'Gaziveren', 'Aydınköy', 'Bostancı'],
    'İskele': ['İskele', 'Yeni Erenkoy', 'Büyükkonuk'],
    'Lefke': ['Lefke', 'Gemikonağı', 'Gaziveren', 'Yedidalga', 'Doğancı', 'Yeşilırmak', 'Bağlıköy', 'Aplıç', 'Cengizköy', 'Bademliköy', 'Ardahan'],
  };

  String? _selectedCity;
  String? _selectedDistrict;
  String? _selectedFuelType;
  String? _selectedGearType;
  final TextEditingController _kmController = TextEditingController();
  final TextEditingController _engineVolumeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final List<String> _fuelTypes = ['Benzin', 'Dizel', 'Hibrit', 'Elektrik'];
  final List<String> _gearTypes = ['Otomatik', 'Manuel'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'İlan Ver',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Araba > ${widget.category} > ${widget.year} > ${widget.brand}',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // İl ve İlçe
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedCity,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                          hintText: 'İl *',
                          hintStyle: TextStyle(
                            color: AppColors.textPrimary.withOpacity(0.5),
                          ),
                        ),
                        items: _districts.keys.map((String city) {
                          return DropdownMenuItem<String>(
                            value: city,
                            child: Text(city),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedCity = newValue;
                            _selectedDistrict = null;
                          });
                        },
                        validator: (value) => value == null ? 'Zorunlu alan' : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedDistrict,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                          hintText: 'İlçe *',
                          hintStyle: TextStyle(
                            color: AppColors.textPrimary.withOpacity(0.5),
                          ),
                        ),
                        items: _selectedCity != null
                            ? _districts[_selectedCity]!.map((String district) {
                                return DropdownMenuItem<String>(
                                  value: district,
                                  child: Text(district),
                                );
                              }).toList()
                            : [],
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedDistrict = newValue;
                          });
                        },
                        validator: (value) => value == null ? 'Zorunlu alan' : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Yakıt ve Vites
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedFuelType,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                          hintText: 'Yakıt Tipi *',
                          hintStyle: TextStyle(
                            color: AppColors.textPrimary.withOpacity(0.5),
                          ),
                        ),
                        items: _fuelTypes.map((String type) {
                          return DropdownMenuItem<String>(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedFuelType = newValue;
                          });
                        },
                        validator: (value) => value == null ? 'Zorunlu alan' : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedGearType,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                          hintText: 'Vites Tipi *',
                          hintStyle: TextStyle(
                            color: AppColors.textPrimary.withOpacity(0.5),
                          ),
                        ),
                        items: _gearTypes.map((String type) {
                          return DropdownMenuItem<String>(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedGearType = newValue;
                          });
                        },
                        validator: (value) => value == null ? 'Zorunlu alan' : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // KM
                TextFormField(
                  controller: _kmController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    hintText: 'KM *',
                    hintStyle: TextStyle(
                      color: AppColors.textPrimary.withOpacity(0.5),
                    ),
                  ),
                  validator: (value) => value?.isEmpty == true ? 'Zorunlu alan' : null,
                ),
                const SizedBox(height: 16),

                // Motor Hacmi
                TextFormField(
                  controller: _engineVolumeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    hintText: 'Motor Hacmi *',
                    hintStyle: TextStyle(
                      color: AppColors.textPrimary.withOpacity(0.5),
                    ),
                  ),
                  validator: (value) => value?.isEmpty == true ? 'Zorunlu alan' : null,
                ),
                const SizedBox(height: 16),

                // Fiyat
                TextFormField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    hintText: 'Fiyat *',
                    hintStyle: TextStyle(
                      color: AppColors.textPrimary.withOpacity(0.5),
                    ),
                  ),
                  validator: (value) => value?.isEmpty == true ? 'Zorunlu alan' : null,
                ),
                const SizedBox(height: 16),

                // İletişim
                TextFormField(
                  controller: _contactController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    hintText: 'İletişim *',
                    hintStyle: TextStyle(
                      color: AppColors.textPrimary.withOpacity(0.5),
                    ),
                  ),
                  validator: (value) => value?.isEmpty == true ? 'Zorunlu alan' : null,
                ),
                const SizedBox(height: 16),

                // Açıklama
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.all(16),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    ),
                    hintText: 'Açıklama *',
                    hintStyle: TextStyle(
                      color: AppColors.textPrimary.withOpacity(0.5),
                    ),
                  ),
                  validator: (value) => value?.isEmpty == true ? 'Zorunlu alan' : null,
                ),
                const SizedBox(height: 24),

                // İlanı Yayınla Butonu
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        // TODO: Form gönderme işlemleri
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'İlanı Yayınla',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}