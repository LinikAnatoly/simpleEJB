
unit EditENRecordPointProm;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENRecordPointPromController ;

type
  TfrmENRecordPointPromEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblAccountNumber : TLabel;
    edtAccountNumber: TEdit;
    lblAccountName : TLabel;
    edtAccountName: TMemo;
    lblAccountCode : TLabel;
    edtAccountCode: TEdit;
    lblCounterNumber : TLabel;
    edtCounterNumber: TEdit;
    lblRecordPointName : TLabel;
    edtRecordPointName: TMemo;
    lblRecordPointAddr : TLabel;
    edtRecordPointAddr: TMemo;
    lblRecordPointKindName : TLabel;
    edtRecordPointKindName: TEdit;
    lblRecordPointCode : TLabel;
    edtRecordPointCode: TEdit;

  lblEPRenRenName : TLabel;
  edtEPRenRenName : TEdit;
  spbEPRenRen : TSpeedButton;
  
  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENRecordPointProm: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblGeograph: TLabel;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    edtGeograph: TEdit;
    HTTPRIOENGeographicDepartment: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbEPRenRenClick(Sender : TObject);
  procedure spbENElementElementClick(Sender : TObject);
    procedure btnGeographClick(Sender: TObject);
    procedure btnGeographClearClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENRecordPointPromEdit: TfrmENRecordPointPromEdit;
  ENRecordPointPromObj: ENRecordPointProm;

implementation

uses
  ShowENEPRen
  //,EPRenController
  ,ShowENElement
  ,ENElementController
, ShowENGeographicDepartment, ENGeographicDepartmentController, ENConsts;

{uses  
    EnergyproController, EnergyproController2, ENRecordPointPromController  ;
}
{$R *.dfm}



procedure TfrmENRecordPointPromEdit.FormShow(Sender: TObject);
  var
  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ENGeographicDepartmentObj : ENGeographicDepartment;
begin
     DisableControls([   edtGeograph ]);
  if DialogState = dsView then
  begin

    DisableControls([
      edtEPRenRenName
      ,spbEPRenRen
      ,edtENElementElementName
      ,spbENElementElement
      ,btnGeograph
      ,btnGeographClear
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtAccountNumber
      ,edtAccountName
      ,edtAccountCode
      ,edtRecordPointName
      ,edtRecordPointKindName
      ,edtRecordPointCode
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENRecordPointPromObj.code);
    edtAccountNumber.Text := ENRecordPointPromObj.accountNumber; 
    MakeMultiline(edtAccountName.Lines, ENRecordPointPromObj.accountName);
    if ( ENRecordPointPromObj.accountCode <> Low(Integer) ) then
       edtAccountCode.Text := IntToStr(ENRecordPointPromObj.accountCode)
    else
       edtAccountCode.Text := '';
    edtCounterNumber.Text := ENRecordPointPromObj.counterNumber; 
    MakeMultiline(edtRecordPointName.Lines, ENRecordPointPromObj.recordPointName);
    MakeMultiline(edtRecordPointAddr.Lines, ENRecordPointPromObj.recordPointAddr);
    edtRecordPointKindName.Text := ENRecordPointPromObj.recordPointKindName; 
    if ( ENRecordPointPromObj.recordPointCode <> Low(Integer) ) then
       edtRecordPointCode.Text := IntToStr(ENRecordPointPromObj.recordPointCode)
    else
       edtRecordPointCode.Text := '';

    edtEPRenRenName.Text := ENRecordPointPromObj.ren.name;
    //edtENElementElementName.Text := ENRecordPointPromObj.element.name;
    if ENRecordPointPromObj.element.geoDepartmentRef <> nil then
      if ENRecordPointPromObj.element.geoDepartmentRef.code <> LOW_INT then
       begin
          // geodept
            TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
          try
            ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( ENRecordPointPromObj.element.geoDepartmentRef.code );
            edtGeograph.Text := ENGeographicDepartmentObj.name;
          except
            on EConvertError do Exit;
          end;
       end;
  end;
end;



procedure TfrmENRecordPointPromEdit.btnGeographClearClick(Sender: TObject);
begin
   ENRecordPointPromObj.element.geoDepartmentRef.code := LOW_INT;
   edtGeograph.Text := '';

end;

procedure TfrmENRecordPointPromEdit.btnGeographClick(Sender: TObject);
var
   frmENGeographicDepartmentShow: TfrmENGeographicDepartmentShow;
   Filter : ENGeographicDepartmentFilter;
   selected : ENGeographicDepartmentShort;
begin
  Filter := ENGeographicDepartmentFilter.Create;
  SetNullIntProps(Filter);
  SetNullXSProps(Filter);


  frmENGeographicDepartmentShow := TfrmENGeographicDepartmentShow.Create(Application, fmNormal, Filter);
  try
      with frmENGeographicDepartmentShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENGeographicDepartmentShort(sgENGeographicDepartment.Objects[0, sgENGeographicDepartment.Row]);
                except
                   on EConvertError do begin  Exit; end;
                end;
                 ENRecordPointPromObj.element.geoDepartmentRef.code := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmENRecordPointPromEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENRecordPointProm: ENRecordPointPromControllerSoapPort;
begin

  //Exit;
  
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtAccountNumber
      ,edtAccountName
      ,edtAccountCode
      ,edtRecordPointName
      ,edtRecordPointKindName
      ,edtRecordPointCode
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENRecordPointProm := HTTPRIOENRecordPointProm as ENRecordPointPromControllerSoapPort;


     ENRecordPointPromObj.accountNumber := edtAccountNumber.Text; 

     ENRecordPointPromObj.accountName := edtAccountName.Text; 

     if ( edtAccountCode.Text <> '' ) then
       ENRecordPointPromObj.accountCode := StrToInt(edtAccountCode.Text)
     else
       ENRecordPointPromObj.accountCode := Low(Integer) ;

     ENRecordPointPromObj.counterNumber := edtCounterNumber.Text; 

     ENRecordPointPromObj.recordPointName := edtRecordPointName.Text; 

     ENRecordPointPromObj.recordPointAddr := edtRecordPointAddr.Text; 

     ENRecordPointPromObj.recordPointKindName := edtRecordPointKindName.Text; 

     if ( edtRecordPointCode.Text <> '' ) then
       ENRecordPointPromObj.recordPointCode := StrToInt(edtRecordPointCode.Text)
     else
       ENRecordPointPromObj.recordPointCode := Low(Integer) ;

    if DialogState = dsInsert then
    begin
      ENRecordPointPromObj.code:=low(Integer);
      TempENRecordPointProm.add(ENRecordPointPromObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENRecordPointProm.save(ENRecordPointPromObj);
    end;
  end;
end;


procedure TfrmENRecordPointPromEdit.spbEPRenRenClick(Sender : TObject);
var 
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
               if ENRecordPointPromObj.ren = nil then ENRecordPointPromObj.ren := EPRen.Create();
               ENRecordPointPromObj.ren.code := StrToInt(GetReturnValue(sgEPRen,0));
               edtEPRenRenName.Text:=GetReturnValue(sgEPRen,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;
end;



procedure TfrmENRecordPointPromEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENRecordPointPromObj.element = nil then ENRecordPointPromObj.element := ENElement.Create();
               ENRecordPointPromObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;



end.