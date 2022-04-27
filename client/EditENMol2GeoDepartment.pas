unit EditENMol2GeoDepartment;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENMol2GeoDepartmentController ;

type
  TfrmENMol2GeoDepartmentEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;

  lblENMolMolName : TLabel;
  edtENMolMolName : TEdit;
  spbENMolMol : TSpeedButton;
  

    HTTPRIOENMol2GeoDepartment: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    HTTPRIOENGeographicDepartment: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENMolMolClick(Sender : TObject);
    procedure btnGeographClick(Sender: TObject);
    procedure btnGeographClearClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENMol2GeoDepartmentEdit: TfrmENMol2GeoDepartmentEdit;
  ENMol2GeoDepartmentObj: ENMol2GeoDepartment;

implementation

uses
  ShowENMol
  ,ENMolController
, ShowENGeographicDepartment, ENGeographicDepartmentController, ENConsts;


{$R *.dfm}

procedure TfrmENMol2GeoDepartmentEdit.FormShow(Sender: TObject);
var
TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ENGeographicDepartmentObj : ENGeographicDepartment;
begin
  DisableControls([edtCode , edtENMolMolName  ,  edtGeograph ]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENMolMolName
      ,spbENMolMol
       ]);
  end;

  if (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin    
    DenyBlankValues([
    ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    if ENMol2GeoDepartmentObj.geoDepartment <> nil then
      if ENMol2GeoDepartmentObj.geoDepartment.code <> LOW_INT then
       begin
            // geodept
            TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
          try
            ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( ENMol2GeoDepartmentObj.geoDepartment.code );
            edtGeograph.Text := ENGeographicDepartmentObj.name;
          except
            on EConvertError do Exit;
          end;
       end;

    edtCode.Text := IntToStr(ENMol2GeoDepartmentObj.code);

    edtENMolMolName.Text := ENMol2GeoDepartmentObj.mol.name;
  end;
end;



procedure TfrmENMol2GeoDepartmentEdit.btnGeographClearClick(Sender: TObject);
begin
  inherited;
    ENMol2GeoDepartmentObj.geoDepartment.code := LOW_INT;
    edtGeograph.Text := '';
end;

procedure TfrmENMol2GeoDepartmentEdit.btnGeographClick(Sender: TObject);
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
                if ENMol2GeoDepartmentObj.geoDepartment = nil then ENMol2GeoDepartmentObj.geoDepartment := ENGeographicDepartmentRef.Create ;
                 ENMol2GeoDepartmentObj.geoDepartment.code := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmENMol2GeoDepartmentEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMol2GeoDepartment: ENMol2GeoDepartmentControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENMol2GeoDepartment := HTTPRIOENMol2GeoDepartment as ENMol2GeoDepartmentControllerSoapPort;


    if DialogState = dsInsert then
    begin
      ENMol2GeoDepartmentObj.code := Low(Integer);
      TempENMol2GeoDepartment.add(ENMol2GeoDepartmentObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENMol2GeoDepartment.save(ENMol2GeoDepartmentObj);
    end;
  end;
end;


procedure TfrmENMol2GeoDepartmentEdit.spbENMolMolClick(Sender : TObject);
var 
   frmENMolShow: TfrmENMolShow;
begin
   frmENMolShow:=TfrmENMolShow.Create(Application,fmNormal);
   try
      with frmENMolShow do
        if ShowModal = mrOk then
        begin
            try
               if ENMol2GeoDepartmentObj.mol = nil then ENMol2GeoDepartmentObj.mol := ENMol.Create();
               ENMol2GeoDepartmentObj.mol.code := StrToInt(GetReturnValue(sgENMol,0));
               edtENMolMolName.Text:=GetReturnValue(sgENMol,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENMolShow.Free;
   end;
end;


end.