using System.IO;
using System.Net.Http;
using System.Threading.Tasks;
using Avalonia.Controls;
using Avalonia.Input;
using Avalonia.Media.Imaging;

namespace AvaloniaDemo;

public partial class MainWindow : Window
{
    private readonly HttpClient _httpClient = new HttpClient();

    public MainWindow()
    {
        InitializeComponent();

        ShowButton.Click += async (_, __) => await ShowContent();
        InputText.KeyDown += async (_, e) => { if (e.Key == Key.Enter) await ShowContent(); };
        ImageUrlBox.KeyDown += async (_, e) => { if (e.Key == Key.Enter) await ShowContent(); };
    }

    private async Task ShowContent()
    {
        // Visa text
        OutputText.Text = InputText.Text;

        // Ladda bild från URL
        string? url = ImageUrlBox.Text;
        if (!string.IsNullOrWhiteSpace(url))
        {
            try
            {
                var bytes = await _httpClient.GetByteArrayAsync(url);
                using (var ms = new MemoryStream(bytes))
                {
                    OutputImage.Source = new Bitmap(ms);
                }
            }
            catch
            {
                OutputImage.Source = null; // ogiltig URL eller fel vid nedladdning
            }
        }
        else
        {
            OutputImage.Source = null;
        }
    }
}