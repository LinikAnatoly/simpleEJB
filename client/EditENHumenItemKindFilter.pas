
unit EditENHumenItemKindFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENHumenItemKindController ;

type
  TfrmENHumenItemKindFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENHumenItemKind: THTTPRIO;

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
  frmENHumenItemKindFilterEdit: TfrmENHumenItemKindFilterEdit;
  ENHumenItemKindFilterObj: ENHumenItemKindFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENHumenItemKindController  ;
}
{$R *.dfm}



procedure TfrmENHumenItemKindFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENHumenItemKindObj.name; 


  end;

}

end;



procedure TfrmENHumenItemKindFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENHumenItemKind: ENHumenItemKindControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENHumenItemKindFilterObj.name := edtName.Text; 




  end;
end;




end.