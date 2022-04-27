
unit EditFINCurrencyFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINCurrencyController ;

type
  TfrmFINCurrencyFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblShortName : TLabel;
    edtShortName: TEdit;

    lblIsoAlphabeticCode : TLabel;
    edtIsoAlphabeticCode: TEdit;

    lblIsoNumericCode : TLabel;
    edtIsoNumericCode: TEdit;

    lblSign : TLabel;
    edtSign: TEdit;



  HTTPRIOFINCurrency: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmFINCurrencyFilterEdit: TfrmFINCurrencyFilterEdit;
  FINCurrencyFilterObj: FINCurrencyFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, FINCurrencyController  ;
}
{$R *.dfm}



procedure TfrmFINCurrencyFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtShortName
      ,edtIsoAlphabeticCode
      ,edtIsoNumericCode
      ,edtSign
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := FINCurrencyObj.name; 



    edtShortName.Text := FINCurrencyObj.shortName; 



    edtIsoAlphabeticCode.Text := FINCurrencyObj.isoAlphabeticCode; 



    edtIsoNumericCode.Text := FINCurrencyObj.isoNumericCode; 



    edtSign.Text := FINCurrencyObj.sign; 


  end;

}

end;



procedure TfrmFINCurrencyFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINCurrency: FINCurrencyControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     FINCurrencyFilterObj.name := edtName.Text; 



     FINCurrencyFilterObj.shortName := edtShortName.Text; 



     FINCurrencyFilterObj.isoAlphabeticCode := edtIsoAlphabeticCode.Text; 



     FINCurrencyFilterObj.isoNumericCode := edtIsoNumericCode.Text; 



     FINCurrencyFilterObj.sign := edtSign.Text; 




  end;
end;




end.