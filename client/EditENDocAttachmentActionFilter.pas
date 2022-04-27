
unit EditENDocAttachmentActionFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDocAttachmentActionController ;

type
  TfrmENDocAttachmentActionFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENDocAttachmentAction: THTTPRIO;

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
  frmENDocAttachmentActionFilterEdit: TfrmENDocAttachmentActionFilterEdit;
  ENDocAttachmentActionFilterObj: ENDocAttachmentActionFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDocAttachmentActionController  ;
}
{$R *.dfm}



procedure TfrmENDocAttachmentActionFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENDocAttachmentActionObj.name; 


  end;

}

end;



procedure TfrmENDocAttachmentActionFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDocAttachmentAction: ENDocAttachmentActionControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENDocAttachmentActionFilterObj.name := edtName.Text; 




  end;
end;




end.