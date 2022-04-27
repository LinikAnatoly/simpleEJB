
unit EditInsertRQPlanPurchase;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPlanPurchaseController ;

type
  TfrmRQPlanPurchaseEditInsert = class(TDialogForm)
    lblName : TLabel;
    edtName: TEdit;
    lblYearGen : TLabel;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;


  HTTPRIORQPlanPurchase: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
  edtYearGen: TComboBox;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
   kindPlanPurchase : Integer;
   year : Integer;
   parentPlanPurchaseCode : Integer;

end;

var
  frmRQPlanPurchaseEditInsert: TfrmRQPlanPurchaseEditInsert;
  RQPlanPurchaseObj: RQPlanPurchase;

implementation

uses ENConsts, RQPlanPurchaseKindController;


{uses  
    EnergyproController, EnergyproController2, RQPlanPurchaseController  ;
}
{$R *.dfm}



procedure TfrmRQPlanPurchaseEditInsert.FormCreate(Sender: TObject);
begin
  inherited;
   kindPlanPurchase := low_int;
   parentPlanPurchaseCode := low_int; // для изменений должен быть парент годового плана закупок
end;

procedure TfrmRQPlanPurchaseEditInsert.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtYearGen
      
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := RQPlanPurchaseObj.name; 
    if ( RQPlanPurchaseObj.yearGen <> Low(Integer) ) then
       edtYearGen.Text := IntToStr(RQPlanPurchaseObj.yearGen)
    else
       edtYearGen.Text := '';
    MakeMultiline(edtCommentGen.Lines, RQPlanPurchaseObj.commentGen);


  end;
end;



procedure TfrmRQPlanPurchaseEditInsert.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPlanPurchase: RQPlanPurchaseControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     // ,edtYearGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    if kindPlanPurchase = Low_int  then
    begin
     Application.MessageBox(PChar('Невизначено тип плану закупівель !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
     Action:=caNone;
    end;


    TempRQPlanPurchase := HTTPRIORQPlanPurchase as RQPlanPurchaseControllerSoapPort;

    RQPlanPurchaseObj:=RQPlanPurchase.Create;
    RQPlanPurchaseObj.kindRef := RQPlanPurchaseKindRef.Create;
    RQPlanPurchaseObj.kindRef.code := kindPlanPurchase;

    if kindPlanPurchase = ENConsts.RQPLANPURCHASE_KIND_CHANGE_FOR_PLAN then
    begin
     RQPlanPurchaseObj.parentRef := RQPlanPurchaseRef.Create;
     RQPlanPurchaseObj.parentRef.code := parentPlanPurchaseCode;



    end;


     RQPlanPurchaseObj.name := edtName.Text;
    if kindPlanPurchase = ENConsts.RQPLANPURCHASE_KIND_CHANGE_FOR_PLAN then
    RQPlanPurchaseObj.yearGen := year
    else
    begin

     if ( edtYearGen.Text <> '' ) then
       RQPlanPurchaseObj.yearGen := StrToInt(edtYearGen.Text)
     else
       RQPlanPurchaseObj.yearGen := Low(Integer) ;
    end;

     RQPlanPurchaseObj.commentGen := edtCommentGen.Text;

    if DialogState = dsInsert then
    begin
      RQPlanPurchaseObj.code:=low(Integer);
      TempRQPlanPurchase.add(RQPlanPurchaseObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQPlanPurchase.save(RQPlanPurchaseObj);
    end;
  end;
end;


end.