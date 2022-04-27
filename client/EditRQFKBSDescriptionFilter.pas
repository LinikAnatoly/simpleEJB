
unit EditRQFKBSDescriptionFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQFKBSDescriptionController ;

type
  TfrmRQFKBSDescriptionFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIORQFKBSDescription: THTTPRIO;

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
  frmRQFKBSDescriptionFilterEdit: TfrmRQFKBSDescriptionFilterEdit;
  RQFKBSDescriptionFilterObj: RQFKBSDescriptionFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQFKBSDescriptionController  ;
}
{$R *.dfm}



procedure TfrmRQFKBSDescriptionFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := RQFKBSDescriptionObj.name; 


  end;

}

end;



procedure TfrmRQFKBSDescriptionFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQFKBSDescription: RQFKBSDescriptionControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQFKBSDescriptionFilterObj.name := edtName.Text; 




  end;
end;




end.