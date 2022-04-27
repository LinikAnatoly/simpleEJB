
unit EditENWiresCutFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWiresCutController ;

type
  TfrmENWiresCutFilterEdit = class(TDialogForm)

    lblWiresCut : TLabel;
    edtWiresCut: TEdit;



  HTTPRIOENWiresCut: THTTPRIO;

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
  frmENWiresCutFilterEdit: TfrmENWiresCutFilterEdit;
  ENWiresCutFilterObj: ENWiresCutFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENWiresCutController  ;
}
{$R *.dfm}



procedure TfrmENWiresCutFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtWiresCut
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENWiresCutObj.wiresCut <> nil ) then
       edtWiresCut.Text := ENWiresCutObj.wiresCut.decimalString
    else
       edtWiresCut.Text := ''; 


  end;

}

end;



procedure TfrmENWiresCutFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENWiresCut: ENWiresCutControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENWiresCutFilterObj.wiresCut = nil ) then
       ENWiresCutFilterObj.wiresCut := TXSDecimal.Create;
     if edtWiresCut.Text <> '' then
       ENWiresCutFilterObj.wiresCut.decimalString := edtWiresCut.Text 
     else
       ENWiresCutFilterObj.wiresCut := nil;





  end;
end;




end.