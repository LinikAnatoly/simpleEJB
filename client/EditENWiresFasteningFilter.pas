
unit EditENWiresFasteningFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWiresFasteningController ;

type
  TfrmENWiresFasteningFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENWiresFastening: THTTPRIO;

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
  frmENWiresFasteningFilterEdit: TfrmENWiresFasteningFilterEdit;
  ENWiresFasteningFilterObj: ENWiresFasteningFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENWiresFasteningController  ;
}
{$R *.dfm}



procedure TfrmENWiresFasteningFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENWiresFasteningObj.name; 


  end;

}

end;



procedure TfrmENWiresFasteningFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENWiresFastening: ENWiresFasteningControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENWiresFasteningFilterObj.name := edtName.Text; 




  end;
end;




end.