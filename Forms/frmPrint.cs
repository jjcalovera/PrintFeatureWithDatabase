using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PrintFeature.Forms
{
    public partial class frmPrint : Form
    {
        public frmPrint()
        {
            InitializeComponent();
        }

        Functions.Print print = new Functions.Print();

        private void frmPrint_Load(object sender, EventArgs e)
        {
            print.printData(this.rprtProducts);
        }
    }
}
