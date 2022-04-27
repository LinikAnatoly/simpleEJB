
unit ShowENMol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENMolController, AdvObj ;


type
  TfrmENMolShow = class(TChildForm)  
  HTTPRIOENMol: THTTPRIO;
    ImageList1: TImageList;
    sgENMol: TAdvStringGrid;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    actSynchronizeMols: TAction;
    ToolButton4: TToolButton;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENMolTopLeftChanged(Sender: TObject);
procedure sgENMolDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actSynchronizeMolsExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }

   isStorage : Boolean;
   class function chooseFromList(isActiveMolsOnly : Boolean) : ENMolShort; stdcall; static;
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENMolShow : TfrmENMolShow;
 // ENMolObj: ENMol;
 // ENMolFilterObj: ENMolFilter;

  
  
implementation

uses Main, EditENMol, EditENMolFilter, ENMolTypeController,
  ENMolStatusController, ENConsts, EditENSynchronizeMols;


{$R *.dfm}

var
  //frmENMolShow : TfrmENMolShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENMolHeaders: array [1..8] of String =
        ( 'Код'
          ,'Код МВО'
          ,'ПІБ МВО'
          ,'Мобільний номер'
          ,'Табельний номер'
          ,'Тип'
          ,'Статус'
          ,'Підрозділ'
        );
   
class function TfrmENMolShow.chooseFromList(isActiveMolsOnly : Boolean) : ENMolShort;
var
  f1 : ENMolFilter;
  frmENMolShow : TfrmENMolShow;
  selectedMol : ENMolShort;
begin
  inherited;
     f1 := ENMolFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     if isActiveMolsOnly then begin
       f1.statusRef := ENMolStatusRef.Create;
       f1.statusRef.code := ENMOLSTATUS_ACTIVE;
     end;

     frmENMolShow:=TfrmENMolShow.Create(Application,fmNormal, f1);
	 selectedMol := nil;
       try
          with frmENMolShow do
          begin
            DisableActions([ actEdit, actInsert ]);
            if ShowModal = mrOk then
            begin
                try
                  selectedMol := ENMolShort(sgENMol.Objects[0, sgENMol.Row]);
                except
                   on EConvertError do Exit;
                end;
            end;
          end;
    finally
      frmENMolShow.Free;
    end;
	Result := selectedMol;
end;

procedure TfrmENMolShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENMolShow:=nil;
    inherited;
  end;


procedure TfrmENMolShow.FormShow(Sender: TObject);
var
  TempENMol: ENMolControllerSoapPort;
  i: Integer;
  ENMolList: ENMolShortList;
begin

  if (isStorage) then DisableActions([actNoFilter]);

  SetGridHeaders(ENMolHeaders, sgENMol.ColumnHeaders);
  ColCount:=100;
  TempENMol :=  HTTPRIOENMol as ENMolControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENMolFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMolList := TempENMol.getScrollableFilteredList(ENMolFilter(FilterObject),0,ColCount);


  LastCount:=High(ENMolList.list);

  if LastCount > -1 then
     sgENMol.RowCount:=LastCount+2
  else
     sgENMol.RowCount:=2;

   with sgENMol do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMolList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENMolList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENMolList.list[i].finCode;
        Cells[2,i+1] := ENMolList.list[i].name;
        Cells[3,i+1] := ENMolList.list[i].phoneNumber;
        Cells[4,i+1] := ENMolList.list[i].tabNumber;
        Cells[5,i+1] := ENMolList.list[i].typeRefName;
        Cells[6,i+1] := ENMolList.list[i].statusRefName;
        Cells[7,i+1] := ENMolList.list[i].departmentRefShortName;
        Objects[0, i+1] := ENMolList.list[i];
        LastRow:=i+1;
        sgENMol.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENMol.Row:=1;
end;

procedure TfrmENMolShow.sgENMolTopLeftChanged(Sender: TObject);
var
  TempENMol: ENMolControllerSoapPort;
  i,CurrentRow: Integer;
  ENMolList: ENMolShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENMol.TopRow + sgENMol.VisibleRowCount) = ColCount
  then
    begin
      TempENMol :=  HTTPRIOENMol as ENMolControllerSoapPort;
      CurrentRow:=sgENMol.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENMolFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMolList := TempENMol.getScrollableFilteredList(ENMolFilter(FilterObject),ColCount-1, 100);

  sgENMol.RowCount:=sgENMol.RowCount+100;
  LastCount:=High(ENMolList.list);
  with sgENMol do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMolList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENMolList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENMolList.list[i].finCode;
        Cells[2,i+CurrentRow] := ENMolList.list[i].name;
        Cells[3,i+CurrentRow] := ENMolList.list[i].phoneNumber;
        Cells[4,i+CurrentRow] := ENMolList.list[i].tabNumber;
        Cells[5,i+CurrentRow] := ENMolList.list[i].typeRefName;
        Cells[6,i+CurrentRow] := ENMolList.list[i].statusRefName;
        Cells[7,i+CurrentRow] := ENMolList.list[i].departmentRefShortName;
        Objects[0, i+CurrentRow] := ENMolList.list[i];
        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENMol.Row:=CurrentRow-5;
   sgENMol.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENMolShow.sgENMolDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENMol,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENMolShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENMol.RowCount-1 do
   for j:=0 to sgENMol.ColCount-1 do
     sgENMol.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENMolShow.actViewExecute(Sender: TObject);
Var TempENMol: ENMolControllerSoapPort;
begin
 TempENMol := HTTPRIOENMol as ENMolControllerSoapPort;
   try
     ENMolObj := TempENMol.getObject(StrToInt(sgENMol.Cells[0,sgENMol.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMolEdit:=TfrmENMolEdit.Create(Application, dsView);
  try
    frmENMolEdit.ShowModal;
  finally
    frmENMolEdit.Free;
    frmENMolEdit:=nil;
  end;
end;

procedure TfrmENMolShow.actEditExecute(Sender: TObject);
Var TempENMol: ENMolControllerSoapPort;
begin
 TempENMol := HTTPRIOENMol as ENMolControllerSoapPort;
   try
     ENMolObj := TempENMol.getObject(StrToInt(sgENMol.Cells[0,sgENMol.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMolEdit:=TfrmENMolEdit.Create(Application, dsEdit);
  try
    if frmENMolEdit.ShowModal= mrOk then
      begin
        //TempENMol.save(ENMolObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENMolEdit.Free;
    frmENMolEdit:=nil;
  end;
end;

procedure TfrmENMolShow.actDeleteExecute(Sender: TObject);
Var TempENMol: ENMolControllerSoapPort;
  ObjCode: Integer;
begin
 TempENMol := HTTPRIOENMol as ENMolControllerSoapPort;
   try
     ObjCode := StrToInt(sgENMol.Cells[0,sgENMol.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Довідник МВО (МОЛы)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENMol.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENMolShow.actInsertExecute(Sender: TObject);
Var TempENMol: ENMolControllerSoapPort;
begin
  TempENMol := HTTPRIOENMol as ENMolControllerSoapPort;

  ENMolObj := ENMol.Create;

  // Засетим по умолчанию тип и статус
  ENMolObj.typeRef := ENMolTypeRef.Create;
  ENMolObj.typeRef.code := ENMOLTYPE_MASTER;
  ENMolObj.statusRef := ENMolStatusRef.Create;
  ENMolObj.statusRef.code := ENMOLSTATUS_ACTIVE;

  try
    frmENMolEdit := TfrmENMolEdit.Create(Application, dsInsert);
    try
      frmENMolEdit.edtType.Text := 'Майстер';
      frmENMolEdit.edtStatus.Text := 'Дійсний';

      if frmENMolEdit.ShowModal = mrOk then
      begin
        if ENMolObj <> nil then
            //TempENMol.add(ENMolObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENMolEdit.Free;
      frmENMolEdit:=nil;
    end;
  finally
    ENMolObj.Free;
  end;
end;

procedure TfrmENMolShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENMolShow.actFilterExecute(Sender: TObject);
begin
  frmENMolFilterEdit := TfrmENMolFilterEdit.Create(Application, dsInsert);
  try
    ENMolFilterObj := ENMolFilter.Create;
    SetNullIntProps(ENMolFilterObj);
    SetNullXSProps(ENMolFilterObj);

    if (isStorage) then
    begin
      ENMolFilterObj.typeRef := ENMolTypeRef.Create;
      ENMolFilterObj.typeRef.code := ENMOLTYPE_STOREKEEPER_CENTRAL;
      frmENMolFilterEdit.edtType.Text := 'Комірник ЦС';
      frmENMolFilterEdit.DisableControls([frmENMolFilterEdit.spbType]);

      ENMolFilterObj.statusRef := ENMolStatusRef.Create;
      ENMolFilterObj.statusRef.code := ENMOLSTATUS_ACTIVE;
      frmENMolFilterEdit.edtStatus.Text := 'Дійсний';
      frmENMolFilterEdit.DisableControls([frmENMolFilterEdit.spbStatus]);
    end;

    if frmENMolFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENMolFilter.Create;
      FilterObject := ENMolFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENMolFilterEdit.Free;
    frmENMolFilterEdit := nil;
  end;
end;

procedure TfrmENMolShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENMolShow.actSynchronizeMolsExecute(Sender: TObject);
var
  frmSynchronizeMols : TfrmSynchronizeMolsEdit;
begin
  frmSynchronizeMols := TfrmSynchronizeMolsEdit.Create(Application, dsInsert);
  try
    if frmSynchronizeMols.ShowModal = mrOk then begin
      actUpdateExecute(Sender);
    end;

  finally
    frmSynchronizeMols.Free;
    frmSynchronizeMols:=nil;
  end;
  inherited;
end;

procedure TfrmENMolShow.FormCreate(Sender: TObject);
begin
  isStorage := False;
end;

end.