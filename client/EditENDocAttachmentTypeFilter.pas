
unit EditENDocAttachmentTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDocAttachmentTypeController ;

type
  TfrmENDocAttachmentTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENDocAttachmentType: THTTPRIO;

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
  frmENDocAttachmentTypeFilterEdit: TfrmENDocAttachmentTypeFilterEdit;
  ENDocAttachmentTypeFilterObj: ENDocAttachmentTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDocAttachmentTypeController  ;
}
{$R *.dfm}



procedure TfrmENDocAttachmentTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENDocAttachmentTypeObj.name; 


  end;

}

end;



procedure TfrmENDocAttachmentTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDocAttachmentType: ENDocAttachmentTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENDocAttachmentTypeFilterObj.name := edtName.Text; 




  end;
end;




end.