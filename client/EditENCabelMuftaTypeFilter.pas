
unit EditENCabelMuftaTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCabelMuftaTypeController ;

type
  TfrmENCabelMuftaTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENCabelMuftaType: THTTPRIO;

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
  frmENCabelMuftaTypeFilterEdit: TfrmENCabelMuftaTypeFilterEdit;
  ENCabelMuftaTypeFilterObj: ENCabelMuftaTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENCabelMuftaTypeController  ;
}
{$R *.dfm}



procedure TfrmENCabelMuftaTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENCabelMuftaTypeObj.name; 


  end;

}

end;



procedure TfrmENCabelMuftaTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCabelMuftaType: ENCabelMuftaTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENCabelMuftaTypeFilterObj.name := edtName.Text; 




  end;
end;




end.