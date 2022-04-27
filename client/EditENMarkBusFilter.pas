
unit EditENMarkBusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMarkBusController ;

type
  TfrmENMarkBusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblBusSection : TLabel;
    edtBusSection: TEdit;



  HTTPRIOENMarkBus: THTTPRIO;

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
  frmENMarkBusFilterEdit: TfrmENMarkBusFilterEdit;
  ENMarkBusFilterObj: ENMarkBusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENMarkBusController  ;
}
{$R *.dfm}



procedure TfrmENMarkBusFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtBusSection
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENMarkBusObj.name; 



    if ( ENMarkBusObj.busSection <> nil ) then
       edtBusSection.Text := ENMarkBusObj.busSection.decimalString
    else
       edtBusSection.Text := ''; 


  end;

}

end;



procedure TfrmENMarkBusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMarkBus: ENMarkBusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENMarkBusFilterObj.name := edtName.Text; 



     if (ENMarkBusFilterObj.busSection = nil ) then
       ENMarkBusFilterObj.busSection := TXSDecimal.Create;
     if edtBusSection.Text <> '' then
       ENMarkBusFilterObj.busSection.decimalString := edtBusSection.Text 
     else
       ENMarkBusFilterObj.busSection := nil;





  end;
end;




end.