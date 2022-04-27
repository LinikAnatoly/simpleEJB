
unit EditENPlanWorkItem2TKKoef;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkItem2TKKoefController ;

type
  TfrmENPlanWorkItem2TKKoefEdit = class(TDialogForm)

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

  lblTKTechCardSourceKoefSourceKoefName : TLabel;
  edtTKTechCardSourceKoefSourceKoefName : TEdit;
  spbTKTechCardSourceKoefSourceKoef : TSpeedButton;
  

  HTTPRIOENPlanWorkItem2TKKoef: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbTKTechCardSourceKoefSourceKoefClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
    techCardSource : Integer;

end;

var
  frmENPlanWorkItem2TKKoefEdit: TfrmENPlanWorkItem2TKKoefEdit;
  ENPlanWorkItem2TKKoefObj: ENPlanWorkItem2TKKoef;

implementation

uses
  ShowTKTechCardSourceKoef
  ,TKTechCardSourceKoefController
, TKTechCardSourceController;

{uses  
    EnergyproController, EnergyproController2, ENPlanWorkItem2TKKoefController  ;
}
{$R *.dfm}



procedure TfrmENPlanWorkItem2TKKoefEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
       edtTKTechCardSourceKoefSourceKoefName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    MakeMultiline(edtCommentGen.Lines, ENPlanWorkItem2TKKoefObj.commentGen);

    edtTKTechCardSourceKoefSourceKoefName.Text := ENPlanWorkItem2TKKoefObj.sourceKoef.name;

  end;
end;



procedure TfrmENPlanWorkItem2TKKoefEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWorkItem2TKKoef: ENPlanWorkItem2TKKoefControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtTKTechCardSourceKoefSourceKoefName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENPlanWorkItem2TKKoef := HTTPRIOENPlanWorkItem2TKKoef as ENPlanWorkItem2TKKoefControllerSoapPort;


     ENPlanWorkItem2TKKoefObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      ENPlanWorkItem2TKKoefObj.code:=low(Integer);
      TempENPlanWorkItem2TKKoef.add(ENPlanWorkItem2TKKoefObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPlanWorkItem2TKKoef.save(ENPlanWorkItem2TKKoefObj);
    end;
  end;
end;


procedure TfrmENPlanWorkItem2TKKoefEdit.spbTKTechCardSourceKoefSourceKoefClick(Sender : TObject);
var 
   frmTKTechCardSourceKoefShow: TfrmTKTechCardSourceKoefShow;
   f : TKTechCardSourceKoefFilter;
begin

   f := TKTechCardSourceKoefFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.techCardSourceRef := TKTechCardSourceRef.Create;
   f.techCardSourceRef.code := techCardSource;

   frmTKTechCardSourceKoefShow:=TfrmTKTechCardSourceKoefShow.Create(Application,fmNormal, f);

   try
      frmTKTechCardSourceKoefShow.DisableActions([
                                                  frmTKTechCardSourceKoefShow.actInsert, frmTKTechCardSourceKoefShow.actEdit,
                                                  frmTKTechCardSourceKoefShow.actDelete, frmTKTechCardSourceKoefShow.actFilter,
                                                  frmTKTechCardSourceKoefShow.actNoFilter
                                                  ]);

      //frmTKTechCardSourceKoefShow.techCardSource := techCardSource;
      with frmTKTechCardSourceKoefShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkItem2TKKoefObj.sourceKoef = nil then ENPlanWorkItem2TKKoefObj.sourceKoef := TKTechCardSourceKoef.Create();
               ENPlanWorkItem2TKKoefObj.sourceKoef.code := StrToInt(GetReturnValue(sgTKTechCardSourceKoef,0));
               edtTKTechCardSourceKoefSourceKoefName.Text:=GetReturnValue(sgTKTechCardSourceKoef,1) + ' ' + GetReturnValue(sgTKTechCardSourceKoef,2);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTechCardSourceKoefShow.Free;
   end;
end;



end.