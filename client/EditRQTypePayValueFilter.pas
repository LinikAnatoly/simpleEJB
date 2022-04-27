
unit EditRQTypePayValueFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQTypePayValueController ;

type
  TfrmRQTypePayValueFilterEdit = class(TDialogForm)

    lblValue : TLabel;
    edtValue: TEdit;



  HTTPRIORQTypePayValue: THTTPRIO;

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
  frmRQTypePayValueFilterEdit: TfrmRQTypePayValueFilterEdit;
  RQTypePayValueFilterObj: RQTypePayValueFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQTypePayValueController  ;
}
{$R *.dfm}



procedure TfrmRQTypePayValueFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtValue
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( RQTypePayValueObj.value <> Low(Integer) ) then
       edtValue.Text := IntToStr(RQTypePayValueObj.value)
    else
       edtValue.Text := '';


  end;

}

end;



procedure TfrmRQTypePayValueFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQTypePayValue: RQTypePayValueControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtValue.Text <> '' ) then
       RQTypePayValueFilterObj.value := StrToInt(edtValue.Text)
     else
       RQTypePayValueFilterObj.value := Low(Integer) ;





  end;
end;




end.