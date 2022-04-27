
unit EditENPositionFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPositionController ;

type
  TfrmENPositionFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblFinCode : TLabel;
    edtFinCode: TEdit;


  HTTPRIOENPosition: THTTPRIO;

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
  frmENPositionFilterEdit: TfrmENPositionFilterEdit;
  ENPositionFilterObj: ENPositionFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPositionController  ;
}
{$R *.dfm}



procedure TfrmENPositionFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENPositionObj.name; 



    if ( ENPositionObj.finCode <> Low(Integer) ) then
       edtFinCode.Text := IntToStr(ENPositionObj.finCode)
    else
       edtFinCode.Text := '';


  end;

}

end;



procedure TfrmENPositionFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPosition: ENPositionControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENPositionFilterObj.name := edtName.Text; 



     if ( edtFinCode.Text <> '' ) then
       ENPositionFilterObj.finCode := StrToInt(edtFinCode.Text)
     else
       ENPositionFilterObj.finCode := Low(Integer) ;





  end;
end;




end.