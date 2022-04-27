
unit EditRQContactTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQContactTypeController ;

type
  TfrmRQContactTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIORQContactType: THTTPRIO;

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
  frmRQContactTypeFilterEdit: TfrmRQContactTypeFilterEdit;
  RQContactTypeFilterObj: RQContactTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQContactTypeController  ;
}
{$R *.dfm}



procedure TfrmRQContactTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := RQContactTypeObj.name; 


  end;

}

end;



procedure TfrmRQContactTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQContactType: RQContactTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQContactTypeFilterObj.name := edtName.Text; 




  end;
end;




end.