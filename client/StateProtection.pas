unit StateProtection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls , DialogFormUnit, ChildFormUnit;

type
  TfrmStateProtection = class(TDialogForm)
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    btnOk: TButton;
    btnCancel: TButton;
    procedure spbEPRenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    coderen : Integer;
  end;

var
  frmStateProtection: TfrmStateProtection;

implementation

uses
  ShowENEPRen, ENElementController, EnergyproController;

{$R *.dfm}

procedure TfrmStateProtection.spbEPRenClick(Sender: TObject);
var 
   frmEPRenShow: TfrmENEPRenShow;
   ENElementFilterObj: ENElementFilter;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try

               coderen := StrToInt(GetReturnValue(sgEPRen,0));
               edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;
end;

procedure TfrmStateProtection.FormShow(Sender: TObject);
begin
   inherited;
   coderen := -1;
end;

end.
