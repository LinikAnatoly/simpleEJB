
unit EditFKTrans2AXTransFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FKTrans2AXTransController ;

type
  TfrmFKTrans2AXTransFilterEdit = class(TDialogForm)

    lblMonthGen : TLabel;
    edtMonthGen: TEdit;

    lblYearGen : TLabel;
    edtYearGen: TEdit;

    lblTaskOwner : TLabel;
    edtTaskOwner: TEdit;



  HTTPRIOFKTrans2AXTrans: THTTPRIO;

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
  frmFKTrans2AXTransFilterEdit: TfrmFKTrans2AXTransFilterEdit;
  FKTrans2AXTransFilterObj: FKTrans2AXTransFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, FKTrans2AXTransController  ;
}
{$R *.dfm}



procedure TfrmFKTrans2AXTransFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtMonthGen
      ,edtYearGen
      ,edtTaskOwner
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( FKTrans2AXTransObj.monthGen <> Low(Integer) ) then
       edtMonthGen.Text := IntToStr(FKTrans2AXTransObj.monthGen)
    else
       edtMonthGen.Text := '';



    if ( FKTrans2AXTransObj.yearGen <> Low(Integer) ) then
       edtYearGen.Text := IntToStr(FKTrans2AXTransObj.yearGen)
    else
       edtYearGen.Text := '';



    edtTaskOwner.Text := FKTrans2AXTransObj.taskOwner; 


  end;

}

end;



procedure TfrmFKTrans2AXTransFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFKTrans2AXTrans: FKTrans2AXTransControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtMonthGen.Text <> '' ) then
       FKTrans2AXTransFilterObj.monthGen := StrToInt(edtMonthGen.Text)
     else
       FKTrans2AXTransFilterObj.monthGen := Low(Integer) ;




     if ( edtYearGen.Text <> '' ) then
       FKTrans2AXTransFilterObj.yearGen := StrToInt(edtYearGen.Text)
     else
       FKTrans2AXTransFilterObj.yearGen := Low(Integer) ;




     FKTrans2AXTransFilterObj.taskOwner := edtTaskOwner.Text; 




  end;
end;




end.