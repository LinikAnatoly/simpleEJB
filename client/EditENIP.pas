
unit EditENIP;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENIPController, AdvObj, ExtCtrls , ENIPItemController , SOAPHTTPTrans,
  tmsAdvGridExcel  ;

type
  TfrmENIPEdit = class(TDialogForm)

  btnOk: TButton;
  btnCancel: TButton;
    HTTPRIOENIP: THTTPRIO;
    pgip: TPageControl;
    tsIP: TTabSheet;
    tsIPItem: TTabSheet;
    lblName: TLabel;
    edtName: TEdit;
    lblYearGen: TLabel;
    edtYearGen: TEdit;
    lblVersion: TLabel;
    edtVersion: TEdit;
    lblCommentGen: TLabel;
    edtCommentGen: TMemo;
    lblCode: TLabel;
    edtCode: TEdit;
    pnlIPItem: TPanel;
    spl1: TSplitter;
    pnlIPItemChild: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    sgENIPItem: TAdvStringGrid;
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
    ImageList1: TImageList;
    HTTPRIOENIPItem: THTTPRIO;
    ToolBar2: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    btnDeleteChild: TToolButton;
    btnEditChild: TToolButton;
    btnRefreshChild: TToolButton;
    btnFilterChild: TToolButton;
    btnNoFilterChild: TToolButton;
    actInsertChild: TAction;
    actEditChild: TAction;
    HTTPRIOENIPPurposeProgram: THTTPRIO;
    HTTPRIOENInvestProgramGroups: THTTPRIO;
    sgENIPItemChild: TAdvStringGrid;
    actViewChild: TAction;
    actDeleteChild: TAction;
    Label1: TLabel;
    grpReport: TGroupBox;
    btnPrintEtapzakupki: TButton;
    btnFinansirIPVipolnenie: TButton;
    btnScopeOfWork: TButton;
    btnPlanPay: TButton;
    ShapePaid: TShape;
    lblPaid: TLabel;
    PopupMenuReport: TPopupMenu;
    N5: TMenuItem;
    N9ExpandByItemChild: TMenuItem;
    btntest_admin: TButton;
    HTTPRIOENServicesObject: THTTPRIO;
    edt_test: TEdit;
    pmExportExcel: TMenuItem;
    actExportExcel: TAction;
    aeExcel: TAdvGridExcelIO;
    PopupMenuChild: TPopupMenu;
    MenuItem8: TMenuItem;
    ActionListChild: TActionList;
    actExportExcelChild: TAction;
    aeExcelChild: TAdvGridExcelIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction); 
  procedure updateENIPItem();
    procedure pgipChange(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure actInsertChildExecute(Sender: TObject);
    procedure actEditChildExecute(Sender: TObject);
    procedure updateENIPItemChild();
    procedure sgENIPItemClick(Sender: TObject);
    procedure sgENIPItemDblClick(Sender: TObject);
    procedure actViewChildExecute(Sender: TObject);
    procedure actDeleteChildExecute(Sender: TObject);
    procedure btnPrintEtapzakupkiClick(Sender: TObject);
    procedure btnFinansirIPVipolnenieClick(Sender: TObject);
    procedure btnScopeOfWorkClick(Sender: TObject);
    procedure btnPlanPayClick(Sender: TObject);
    procedure sgENIPItemChildDblClick(Sender: TObject);
    function  isDifferentValueNkreAndInside(ENIPItemList: ENIPItemShortList;i : Integer):Boolean;
    procedure N5Click(Sender: TObject);
    procedure N9ExpandByItemChildClick(Sender: TObject);
    procedure btntest_adminClick(Sender: TObject);
    procedure actExportExcelExecute(Sender: TObject);
    procedure actExportExcelChildExecute(Sender: TObject);

  private
    { Private declarations }
    selectedItemParentIndex: Integer;
    selectedItemChildIndex : Integer;
  public
    { Public declarations }

end;

var
  frmENIPEdit: TfrmENIPEdit;
  ENIPObj: ENIP;

implementation

uses  EditENIPItem, EditENIPItemFilter,
  ENIPPurposeProgramController, ENInvestProgramGroupsController, DMReportsUnit,
  reportIP, Main, ENReportsController, ENServicesObjectController, ENConsts , Globals , ShellAPI ;


{uses  
    EnergyproController, EnergyproController2, ENIPController  ;
}
{$R *.dfm}


var
ENIPItemHeaders: array [1..25] of String =
        ( 'Код'  // 0
          ,'Розділ ІП'    // 1
          ,'Пункт ІП' // 2
          ,'Цільова програма' // 3
          ,'Назва об`єкта, продукції ...' //4
          ,'Бух. назва об`єкта, продукції ...' //5

          ,'Інв. номер/номера'     // 6
          ,'Проектна документація'     // 7
          ,'Джерело фінансування'   // 8
          ,'Кільк. (рік)'  // 9
          ,'Ціна, тис. грн. без ПДВ (рік)' //10
          ,'Сума, тис. грн. без ПДВ (рік)'     //11
          ,'Кількість, (1-й кв.)'             //12
          ,'Сума, тис. грн. без ПДВ (1-й кв.)'   //13
          ,'Кільк., (2-й кв.)'               // 14
          ,'Сума, тис. грн. без ПДВ (2-й кв.)'   // 15
          ,'Кільк.,(3-й кв.)'                //16
          ,'Сума, тис. грн. без ПДВ (3-й кв.)'    //17
          ,'Кільк.,(4-й кв.)'                //18
          ,'Сума, тис. грн. без ПДВ (4-й кв.)'    //19
          ,'Користувач, який створив запис'                             //20
          ,'Дата створення'                                             //21
          ,'Користувач, який вніс зміни'                                //22
          ,'Дата зміни'                                                 //23
          ,'Примітка'                                                   // 24
        );
ENIPItemHeadersChild: array [1..25] of String =
        ( 'Код'  // 0
          ,'Розділ ІП'    // 1
          ,'Пункт ІП' // 2
          ,'Цільова програма' // 3
          ,'Назва об`єкта, продукції ...' //4
          ,'Бух. назва об`єкта, продукції ...' //5
          ,'Інв. номер/номера'     // 6
          ,'Проектна документація'     // 7
          ,'Джерело фінансування'   // 8
          ,'Кільк. (рік)'  // 9
          ,'Ціна, тис. грн. без ПДВ (рік)' //10
          ,'Сума, тис. грн. без ПДВ (рік)'     //11
          ,'Кількість, (1-й кв.)'             //12
          ,'Сума, тис. грн. без ПДВ (1-й кв.)'   //13
          ,'Кільк., (2-й кв.)'               // 14
          ,'Сума, тис. грн. без ПДВ (2-й кв.)'   // 15
          ,'Кільк.,(3-й кв.)'                //16
          ,'Сума, тис. грн. без ПДВ (3-й кв.)'    //17
          ,'Кільк.,(4-й кв.)'                //18
          ,'Сума, тис. грн. без ПДВ (4-й кв.)'    //19
          ,'Користувач, який створив запис'                             //20
          ,'Дата створення'                                             //21
          ,'Користувач, який вніс зміни'                                //22
          ,'Дата зміни'                                                 //23
          ,'Примітка'                                                   // 24
        );


procedure TfrmENIPEdit.FormShow(Sender: TObject);
begin


 { 09.03.2016 - задание Салыгина скрыть кнопки для всех кроме щербины и тимосевич}
  btnPrintEtapzakupki.Visible := ((UpperCase(HTTPRIOENIP.HTTPWebNode.UserName) = UpperCase('energynet'))
        or
         (UpperCase(HTTPRIOENIP.HTTPWebNode.UserName) = UpperCase('scherbinaav'))
        or
         (UpperCase(HTTPRIOENIP.HTTPWebNode.UserName) = UpperCase('timosevichjs'))
        or
         (UpperCase(HTTPRIOENIP.HTTPWebNode.UserName) = UpperCase('safronovin'))
         )  ;
  btnScopeOfWork.Visible := btnPrintEtapzakupki.Visible;

  pgip.ActivePage := tsIP;
  DisableControls([edtCode, edtVersion]);
  SetFloatStyle(edtYearGen);

  SetGridHeaders(ENIPItemHeaders, sgENIPItem.ColumnHeaders);
  SetGridHeaders(ENIPItemHeadersChild, sgENIPItemChild.ColumnHeaders);

  HideControls([ShapePaid , lblPaid]);

  if DialogState = dsInsert then
  begin
     pgip.Pages[1].TabVisible := false;
     DisableControls([btnPrintEtapzakupki , btnFinansirIPVipolnenie , btnScopeOfWork ]);
     HideControls([grpReport]);
     edtVersion.Text := '1';
  end;

  if DialogState = dsEdit then
  begin
    DisableControls([edtYearGen]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtYearGen
      ,edtVersion
//      ,edtDateAdd
//      ,edtDateEdit
//      ,edtUserAdd
//      ,edtUserEdit
//      ,edtModifytime
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENIPObj.code);
    edtName.Text := ENIPObj.name; 
    if ( ENIPObj.yearGen <> Low(Integer) ) then
       edtYearGen.Text := IntToStr(ENIPObj.yearGen)
    else
       edtYearGen.Text := '';
    if ( ENIPObj.version <> Low(Integer) ) then
       edtVersion.Text := IntToStr(ENIPObj.version)
    else
       edtVersion.Text := '';
    MakeMultiline(edtCommentGen.Lines, ENIPObj.commentGen);
//      if ENIPObj.dateAdd <> nil then
//      begin
//        edtDateAdd.DateTime:=EncodeDate(ENIPObj.dateAdd.Year,ENIPObj.dateAdd.Month,ENIPObj.dateAdd.Day);
//        edtDateAdd.checked := true;
//      end
//      else
//      begin
//        edtDateAdd.DateTime:=SysUtils.Date;
//        edtDateAdd.checked := false;
//      end;
//      if ENIPObj.dateEdit <> nil then
//      begin
//        edtDateEdit.DateTime:=EncodeDate(ENIPObj.dateEdit.Year,ENIPObj.dateEdit.Month,ENIPObj.dateEdit.Day);
//        edtDateEdit.checked := true;
//      end
//      else
//      begin
//        edtDateEdit.DateTime:=SysUtils.Date;
//        edtDateEdit.checked := false;
//      end;
//    edtUserAdd.Text := ENIPObj.userAdd;
//    edtUserEdit.Text := ENIPObj.userEdit;
//      if ENIPObj.modifytime <> nil then
//      begin
//        edtModifytime.DateTime:=EncodeDate(ENIPObj.modifytime.Year,ENIPObj.modifytime.Month,ENIPObj.modifytime.Day);
//        edtModifytime.checked := true;
//      end
//      else
//      begin
//        edtModifytime.DateTime:=SysUtils.Date;
//        edtModifytime.checked := false;
//      end;


  end;

   if ((HTTPRIOENIP.HTTPWebNode.UserName = 'energynet') or (HTTPRIOENIP.HTTPWebNode.UserName = 'marchenkoyp') or (HTTPRIOENIP.HTTPWebNode.UserName = 'MarchenkoYP') )  then
    begin
     btntest_admin.Visible:= True;
     edt_test.Visible:= True;
     edt_test.Enabled:= True;
     HideControls([edt_test],false );
     DisableControls([edt_test],false);
    end
     else
     begin
      btntest_admin.Visible:= False;
      edt_test.Visible:= false;
      edt_test.Enabled:= false;
     end;
end;



procedure TfrmENIPEdit.pgipChange(Sender: TObject);
begin
  inherited;
    if pgip.ActivePage = tsIPItem  then
    begin
      updateENIPItem();
      HideControls([ShapePaid , lblPaid],false );
    end
    else
    begin
      HideControls([ShapePaid , lblPaid]);
    end;

     if (pgip.ActivePage = tsIPItem) then
      selectedItemParentIndex := sgENIPItem.Row;
end;

procedure TfrmENIPEdit.sgENIPItemChildDblClick(Sender: TObject);
begin
  inherited;
   actViewChildExecute(Sender);
end;

procedure TfrmENIPEdit.sgENIPItemClick(Sender: TObject);
begin
  inherited;
   updateENIPItemChild();
end;

procedure TfrmENIPEdit.sgENIPItemDblClick(Sender: TObject);
begin
  inherited;
   actViewExecute(Self);
end;

procedure TfrmENIPEdit.actDeleteChildExecute(Sender: TObject);
Var TempENIPItem: ENIPItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempENIPItem := HTTPRIOENIPItem as ENIPItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENIPItemChild.Cells[0,sgENIPItemChild.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Пункти інвестпрограми ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENIPItem.remove(ObjCode);
      updateENIPItem();
  end;
end;

procedure TfrmENIPEdit.actDeleteExecute(Sender: TObject);
Var TempENIPItem: ENIPItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempENIPItem := HTTPRIOENIPItem as ENIPItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENIPItem.Cells[0,sgENIPItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Пункти інвестпрограми ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENIPItem.remove(ObjCode);
      updateENIPItem();
  end;
end;

procedure TfrmENIPEdit.actEditChildExecute(Sender: TObject);
Var TempENIPItem: ENIPItemControllerSoapPort;
begin
 TempENIPItem := HTTPRIOENIPItem as ENIPItemControllerSoapPort;
   try
     ENIPItemObj := TempENIPItem.getObject(StrToInt(sgENIPItemChild.Cells[0,sgENIPItemChild.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENIPItemEdit:=TfrmENIPItemEdit.Create(Application, dsEdit);
  DisableControls([frmENIPItemEdit.spbIPPURPOSEPROGRAM , frmENIPItemEdit.spbInvestProgramGroups]);
  selectedItemParentIndex := sgENIPItem.Row;
  selectedItemChildIndex := sgENIPItemChild.Row;
  try
    if frmENIPItemEdit.ShowModal= mrOk then
      begin

        updateENIPItem();



      end;
  finally
    frmENIPItemEdit.Free;
    frmENIPItemEdit:=nil;
  end;

       if selectedItemParentIndex <> 0 then
        begin
        if sgENIPItem.RowCount > selectedItemParentIndex then
           sgENIPItem.Row := selectedItemParentIndex
        else
           sgENIPItem.Row := sgENIPItem.RowCount - 1;
        end
        else
        sgENIPItem.Row:=1;

        if selectedItemChildIndex <> 0 then
        begin
        if sgENIPItemChild.RowCount > selectedItemChildIndex then
           sgENIPItemChild.Row := selectedItemChildIndex
        else
           sgENIPItemChild.Row := sgENIPItemChild.RowCount - 1;
        end
        else
        sgENIPItemChild.Row:=1;
end;

procedure TfrmENIPEdit.actEditExecute(Sender: TObject);
Var TempENIPItem: ENIPItemControllerSoapPort;
begin
 TempENIPItem := HTTPRIOENIPItem as ENIPItemControllerSoapPort;
   try
     ENIPItemObj := TempENIPItem.getObject(StrToInt(sgENIPItem.Cells[0,sgENIPItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENIPItemEdit:=TfrmENIPItemEdit.Create(Application, dsEdit);
  selectedItemParentIndex := sgENIPItem.Row;
  try
    if frmENIPItemEdit.ShowModal= mrOk then
      begin

        updateENIPItem();
      end;
  finally
    frmENIPItemEdit.Free;
    frmENIPItemEdit:=nil;
  end;

          if selectedItemParentIndex <> 0 then
        begin
        if sgENIPItem.RowCount > selectedItemParentIndex then
           sgENIPItem.Row := selectedItemParentIndex
        else
           sgENIPItem.Row := sgENIPItem.RowCount - 1;
        end
        else
        sgENIPItem.Row:=1;
end;

procedure TfrmENIPEdit.actExportExcelChildExecute(Sender: TObject);
var AppPath, FileName: String;
    OldCursor: TCursor;
begin
  inherited;
  if Application.MessageBox(PChar('Цей список може бути не весь (вибираються по 100 записів)... долистайте до кінця списку... '+#10#13+' Зберегти в Ексель?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

        if ENIPObj = nil then Exit;

        OldCursor := Screen.Cursor;
        try
          Screen.Cursor := crHourGlass;

          AppPath := ExtractFilePath(Application.ExeName);
          if not DirectoryExists(AppPath + TempReportsPath) then
            CreateDir(AppPath + TempReportsPath);
          FileName := AppPath + TempReportsPath + GetFileName('Строки_ІП_(фільтр)' +
                        StringReplace(ENIPObj.name+IntToStr(ENIPObj.version), ' ', '_',
                                [rfReplaceAll, rfIgnoreCase]) + '_') + '.xls';

          aeExcelChild.XLSExport(FileName);
          ShellExecute(0,
                       PChar('open'),
                       PChar('"' + FileName + '"'),
                       nil,
                       nil,
                       SW_SHOWMAXIMIZED);
        finally
          Screen.Cursor := OldCursor;
        end;
     end;
end;

procedure TfrmENIPEdit.actExportExcelExecute(Sender: TObject);
var AppPath, FileName: String;
    OldCursor: TCursor;
begin
  inherited;
  if Application.MessageBox(PChar('Цей список може бути не весь (вибираються по 100 записів)... долистайте до кінця списку... '+#10#13+' Зберегти в Ексель?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

        if ENIPObj = nil then Exit;

        OldCursor := Screen.Cursor;
        try
          Screen.Cursor := crHourGlass;

          AppPath := ExtractFilePath(Application.ExeName);
          if not DirectoryExists(AppPath + TempReportsPath) then
            CreateDir(AppPath + TempReportsPath);
          FileName := AppPath + TempReportsPath + GetFileName('Строки_ІП_(фільтр)' +
                        StringReplace(ENIPObj.name+IntToStr(ENIPObj.version), ' ', '_',
                                [rfReplaceAll, rfIgnoreCase]) + '_') + '.xls';

          aeExcel.XLSExport(FileName);
          ShellExecute(0,
                       PChar('open'),
                       PChar('"' + FileName + '"'),
                       nil,
                       nil,
                       SW_SHOWMAXIMIZED);
        finally
          Screen.Cursor := OldCursor;
        end;
     end;
end;

procedure TfrmENIPEdit.actFilterExecute(Sender: TObject);
var
  enipitemFil : ENIPItemFilter;
begin
frmENIPItemFilterEdit:=TfrmENIPItemFilterEdit.Create(Application, dsInsert);
  try
    if ENIPItemFilterObj = nil then
    begin  ENIPItemFilterObj := ENIPItemFilter.Create;
     SetNullIntProps(ENIPItemFilterObj);
     SetNullXSProps(ENIPItemFilterObj);
    end;
    ENIPItemFilterObj.ipRef := ENIPRef.Create;
    ENIPItemFilterObj.ipRef.code := ENIPObj.code;

    if frmENIPItemFilterEdit.ShowModal = mrOk then
    begin

      //enipitemFil := ENIPItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENIPItemFilterEdit.Free;
    frmENIPItemFilterEdit:=nil;
  end;
end;

procedure TfrmENIPEdit.actInsertChildExecute(Sender: TObject);
// Var TempENIPItem: ENIPItemControllerSoapPort;
  var
  ObjCode : Integer;
  ENIPItemObjParent : ENIPItem;
  TempENIPItem: ENIPItemControllerSoapPort;
  TempENIPPurposeProgram : ENIPPurposeProgramControllerSoapPort;
  purposeProgram : ENIPPurposeProgram;

  TempENInvestProgramGroups: ENInvestProgramGroupsControllerSoapPort;
  investProgramGroup: ENInvestProgramGroups;
begin
  // TempENIPItem := HTTPRIOENIPItem as ENIPItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENIPItemObj:=ENIPItem.Create;

   try
     ObjCode := StrToInt(sgENIPItem.Cells[0,sgENIPItem.Row]);
   except
   on EConvertError do Exit;
  end;
    TempENIPItem := HTTPRIOENIPItem as ENIPItemControllerSoapPort;
    ENIPItemObjParent := TempENIPItem.getObject(ObjCode);



  try
    frmENIPItemEdit:=TfrmENIPItemEdit.Create(Application, dsInsert);
    ENIPItemObj.ipRef := ENIPRef.Create;
    ENIPItemObj.ipRef.code := ENIPObj.code;

    // c родительского пункта сетим сразу целевую программу для дочернего
    ENIPItemObj.purposeProgramRef := ENIPPurposeProgramRef.Create;
    ENIPItemObj.purposeProgramRef.code := ENIPItemObjParent.purposeProgramRef.code;

    TempENIPPurposeProgram := HTTPRIOENIPPurposeProgram as ENIPPurposeProgramControllerSoapPort;
        purposeProgram := TempENIPPurposeProgram.getObject(ENIPItemObj.purposeProgramRef.code);
        if purposeProgram <> nil then
          frmENIPItemEdit.edtIPPURPOSEPROGRAM.Text := purposeProgram.name;


    // c родительского пункта сетим сразу раздел ИП для дочернего
     ENIPItemObj.invGroupRef := ENInvestProgramGroupsRef.Create;
     ENIPItemObj.invGroupRef.code := ENIPItemObjParent.invGroupRef.code;

     TempENInvestProgramGroups := HTTPRIOENInvestProgramGroups as ENInvestProgramGroupsControllerSoapPort;
     investProgramGroup := TempENInvestProgramGroups.getObject(ENIPItemObj.invGroupRef.code);
        if investProgramGroup <> nil then
          frmENIPItemEdit.edtInvestProgramGroupsName.Text := investProgramGroup.name + '. ' + investProgramGroup.commentgen;


    DisableControls([frmENIPItemEdit.spbIPPURPOSEPROGRAM , frmENIPItemEdit.spbInvestProgramGroups]);

    ENIPItemObj.parentRef := ENIPItemRef.Create;
    ENIPItemObj.parentRef.code := ObjCode;

    try
      if frmENIPItemEdit.ShowModal = mrOk then
      begin
        if ENIPItemObj<>nil then

            updateENIPItem();
      end;
    finally
      frmENIPItemEdit.Free;
      frmENIPItemEdit:=nil;
    end;
  finally
    ENIPItemObj.Free;
  end;
end;

procedure TfrmENIPEdit.actInsertExecute(Sender: TObject);
// Var TempENIPItem: ENIPItemControllerSoapPort;

begin
  // TempENIPItem := HTTPRIOENIPItem as ENIPItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENIPItemObj:=ENIPItem.Create;

  try
    frmENIPItemEdit:=TfrmENIPItemEdit.Create(Application, dsInsert);
    ENIPItemObj.ipRef := ENIPRef.Create;
    ENIPItemObj.ipRef.code := ENIPObj.code;

 

    try
      if frmENIPItemEdit.ShowModal = mrOk then
      begin
        if ENIPItemObj<>nil then
            //TempENIPItem.add(ENIPItemObj);
            updateENIPItem();
      end;
    finally
      frmENIPItemEdit.Free;
      frmENIPItemEdit:=nil;
    end;
  finally
    ENIPItemObj.Free;
  end;
end;

procedure TfrmENIPEdit.actNoFilterExecute(Sender: TObject);
begin
  inherited;

    ENIPItemFilterObj.Free;
    ENIPItemFilterObj := nil;

    updateENIPItem();
end;

procedure TfrmENIPEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;
   updateENIPItem();
end;

procedure TfrmENIPEdit.actViewChildExecute(Sender: TObject);
Var TempENIPItem: ENIPItemControllerSoapPort;
begin
 TempENIPItem := HTTPRIOENIPItem as ENIPItemControllerSoapPort;
   try
     ENIPItemObj := TempENIPItem.getObject(StrToInt(sgENIPItemChild.Cells[0,sgENIPItemChild.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENIPItemEdit:=TfrmENIPItemEdit.Create(Application, dsView);
  try
    frmENIPItemEdit.ShowModal;
  finally
    frmENIPItemEdit.Free;
    frmENIPItemEdit:=nil;
  end;
end;

procedure TfrmENIPEdit.actViewExecute(Sender: TObject);
Var TempENIPItem: ENIPItemControllerSoapPort;
begin
 TempENIPItem := HTTPRIOENIPItem as ENIPItemControllerSoapPort;
   try
     ENIPItemObj := TempENIPItem.getObject(StrToInt(sgENIPItem.Cells[0,sgENIPItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENIPItemEdit:=TfrmENIPItemEdit.Create(Application, dsView);
  try
    frmENIPItemEdit.ShowModal;
  finally
    frmENIPItemEdit.Free;
    frmENIPItemEdit:=nil;
  end;
end;

procedure TfrmENIPEdit.btnFinansirIPVipolnenieClick(Sender: TObject);
begin
  inherited;
   frmReportIP := TfrmReportIP.Create(Application, dsInsert);
   frmReportIP.enipObjectCode:= ENIPObj.code;
   frmReportIP.inform_nkre := 0;
   frmReportIP.byIpItemParent := 1;
 try
   frmReportIP.ShowModal;
 finally
   frmReportIP.Free;

 end;
end;

procedure TfrmENIPEdit.btnPlanPayClick(Sender: TObject);
begin
  inherited;
   frmReportIP := TfrmReportIP.Create(Application, dsInsert);
   frmReportIP.enipObjectCode:= ENIPObj.code;
   frmReportIP.reportvid := 4;
   frmReportIP.IPyear := ENIPObj.yearGen;
 try
   frmReportIP.ShowModal;
 finally
   frmReportIP.Free;

 end;
end;

procedure TfrmENIPEdit.btnPrintEtapzakupkiClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'ipcode';
  args[0] := IntToStr(ENIPObj.code);


   reportName := 'Invest/StagesBuy/main';
  makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmENIPEdit.btnScopeOfWorkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'ipcode';
  args[0] := IntToStr(ENIPObj.code);


   reportName := 'Invest/ScopeOfWork/main';
  makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmENIPEdit.btntest_adminClick(Sender: TObject);
var
 TempENIP: ENIPControllerSoapPort;
 p , i: integer;
begin

  inherited;
    TempENIP := HTTPRIOENIP as ENIPControllerSoapPort;

    // TempENIP.test_admin(StrToInt(edt_test.Text));
    TempENIP.test_admin(StrToInt( edt_test.Text ) );

end;

//var
//  argNames, args: ArrayOfString;
//  reportName: String;
//  renCodes : String;
//  var ys,ms,ds,yf,mf,df: Word;
//  i : Integer;
//begin
// renCodes := '';
//   begin
//      SetLength(argNames, 11);
//      SetLength(args, 11);
//
//      argNames[0] := 'pdate1';
//     // args[0] := '25.02.2010';
//      args[0] := '01.01.2016';
//
//      argNames[1] := 'pdate2';
//      args[1] := '31.01.2016';
//
//      argNames[2] := 'rencode';
//      args[2] := IntToStr(18);
//
//
//
//      // Если выбраны несколько подразделений
//      if(Length(renCodes) > 0) then args[2] := renCodes;
//
//      argNames[3] := 'renname';
//      args[3] := 'visokopole';
//
//      argNames[4] := 'plankind'; // признак плана (задание факт = 4 : задание план = 3)
//      if 2 = 4 then
//         args[4] := '4';
//      if 2 = 3 then
//         args[4] := '3';
//      if 2 = 2 then
//         args[4] := '2';
//      if 2 = 1 then
//         args[4] := '1';
//
//       argNames[5] := 'Year';
//       args[5] := '2016' ;
//
//
//       argNames[7] := 'brigadeName';
//       args[7] := '';
//
//        argNames[8] := 'countByStaffing';
//        args[8]:= '1';
//
//        reportName := 'NPZ_dodat3_zbyt_norms/dodat3'; // tezzzt новый вид отчета по сбыту задание SUPP-43457
//
//        makeReport(reportName , argNames , args , 'xls');
//
//     end
//
//end;

procedure TfrmENIPEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENIP: ENIPControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtYearGen

     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENIP := HTTPRIOENIP as ENIPControllerSoapPort;


     ENIPObj.name := edtName.Text;

     if ( edtYearGen.Text <> '' ) then
       ENIPObj.yearGen := StrToInt(edtYearGen.Text)
     else
       ENIPObj.yearGen := Low(Integer) ;


     ENIPObj.commentGen := edtCommentGen.Text;


    if DialogState = dsInsert then
    begin
      ENIPObj.code:=low(Integer);
      TempENIP.add(ENIPObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENIP.save(ENIPObj);
    end;

  end;
    ENIPItemFilterObj.Free;
    ENIPItemFilterObj := nil;
end;


procedure TfrmENIPEdit.updateENIPItem();
var
  TempENIPItem: ENIPItemControllerSoapPort;
  i: Integer;
  ENIPItemList: ENIPItemShortList;
  enipitemFil : ENIPItemFilter;
  ColCount  , LastCount: Integer;
  LastRow : Integer;
  begin

  ClearGrid(sgENIPItem);
  LastRow :=1;

  ColCount:=2000;
  TempENIPItem :=  HTTPRIOENIPItem as ENIPItemControllerSoapPort;

    if ENIPItemFilterObj = nil then
    begin  ENIPItemFilterObj := ENIPItemFilter.Create;
     SetNullIntProps(ENIPItemFilterObj);
     SetNullXSProps(ENIPItemFilterObj);
    end;

   enipitemFil := ENIPItemFilter.Create;
   SetNullIntProps(enipitemFil);
   SetNullXSProps(enipitemFil);
   enipitemFil := ENIPItemFilterObj;

  enipitemFil.ipRef := ENIPRef.Create;
  enipitemFil.ipRef.code := ENIPObj.code;
  enipitemFil.conditionSQL := ' enipitem.parentrefcode is null ';
  enipitemFil.orderBySQL :=  ' ENINVESTPROGRAMGROUPS.CODE  ,  func_order_(ENIPITEM.ITEMNUMBER) , ENIPPURPOSEPROGRAM.CODE ' ;


  ENIPItemList := TempENIPItem.getScrollableFilteredList(enipitemFil,0,ColCount);


  LastCount:=High(ENIPItemList.list);

  if LastCount > -1 then
     sgENIPItem.RowCount:=LastCount+2
  else
     sgENIPItem.RowCount:=2;

   with sgENIPItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENIPItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENIPItemList.list[i].code)
        else
        Cells[0,i+1] := '';


        Cells[1,i+1] := ENIPItemList.list[i].invGroupRefName;
        Cells[2,i+1] := ENIPItemList.list[i].itemNumber;

        // цільова програма

        Cells[3,i+1] := ENIPItemList.list[i].purposeProgramRefName;


        Cells[4,i+1] := ENIPItemList.list[i].name;
        Cells[5,i+1] := ENIPItemList.list[i].buhName;

        Cells[6,i+1] := ENIPItemList.list[i].invNumber;
        if ENIPItemList.list[i].isProjectDocument = Low(Integer) then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := IntToStr(ENIPItemList.list[i].isProjectDocument);

        Cells[8,i+1] := ENIPItemList.list[i].financing;


        if ENIPItemList.list[i].countGen = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := ENIPItemList.list[i].countGen.DecimalString;
        if ENIPItemList.list[i].price = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := ENIPItemList.list[i].price.DecimalString;
        if ENIPItemList.list[i].sumGen = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := ENIPItemList.list[i].sumGen.DecimalString;
        if ENIPItemList.list[i].quarter1count = nil then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := ENIPItemList.list[i].quarter1count.DecimalString;
        if ENIPItemList.list[i].quarter1sum = nil then
          Cells[13,i+1] := ''
        else
          Cells[13,i+1] := ENIPItemList.list[i].quarter1sum.DecimalString;
        if ENIPItemList.list[i].quarter2count = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := ENIPItemList.list[i].quarter2count.DecimalString;
        if ENIPItemList.list[i].quarter2sum = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := ENIPItemList.list[i].quarter2sum.DecimalString;
        if ENIPItemList.list[i].quarter3count = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := ENIPItemList.list[i].quarter3count.DecimalString;
        if ENIPItemList.list[i].quarter3sum = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := ENIPItemList.list[i].quarter3sum.DecimalString;
        if ENIPItemList.list[i].quarter4count = nil then
          Cells[18,i+1] := ''
        else
          Cells[18,i+1] := ENIPItemList.list[i].quarter4count.DecimalString;
        if ENIPItemList.list[i].quarter4sum = nil then
          Cells[19,i+1] := ''
        else
          Cells[19,i+1] := ENIPItemList.list[i].quarter4sum.DecimalString;

        Cells[20,i+1] := ENIPItemList.list[i].userAdd;

        if ENIPItemList.list[i].dateAdd = nil then
          Cells[21,i+1] := ''
        else
          Cells[21,i+1] := XSDateTimeWithDate2String(ENIPItemList.list[i].dateAdd);

        Cells[22,i+1] := ENIPItemList.list[i].userGen;

        if ENIPItemList.list[i].dateEdit = nil then
          Cells[23,i+1] := ''
        else
          Cells[23,i+1] := XSDateTimeWithDate2String(ENIPItemList.list[i].dateEdit);

        Cells[24,i+1] := ENIPItemList.list[i].commentGen;

        // подсветка если суммы или количество нкре не совпадают с суммами для финансирования

        if isDifferentValueNkreAndInside(ENIPItemList , i ) = True then
           sgENIPItem.RowColor[i + 1] := clYellow
        else
           sgENIPItem.RowColor[i + 1] := clWindow;

        //

        

        LastRow:=i+1;
        sgENIPItem.RowCount:=LastRow+1;

      end;
   ColCount:=ColCount+1;
   sgENIPItem.Row:=1;


       


        sgENIPItemClick(self);





end;


procedure TfrmENIPEdit.updateENIPItemChild();
var
  TempENIPItem: ENIPItemControllerSoapPort;
  i: Integer;
  ENIPItemList: ENIPItemShortList;
  enipitemFilChild : ENIPItemFilter;
  ColCount  , LastCount: Integer;
  LastRow , ItemParentCode: Integer;
  begin

    ClearGrid(sgENIPItemChild);
  try
     ItemParentCode := StrToInt(sgENIPItem.Cells[0,sgENIPItem.Row]);
   except
   on EConvertError do Exit;
  end;

  LastRow :=1;

  ColCount:=2000;
  TempENIPItem :=  HTTPRIOENIPItem as ENIPItemControllerSoapPort;


     enipitemFilChild := ENIPItemFilter.Create;
     SetNullIntProps(enipitemFilChild);
     SetNullXSProps(enipitemFilChild);


  enipitemFilChild.ipRef := ENIPRef.Create;
  enipitemFilChild.ipRef.code := ENIPObj.code;

  enipitemFilChild.parentRef := ENIPItemRef.Create;
  enipitemFilChild.parentRef.code :=  ItemParentCode;

//   enipitemFil.conditionSQL := '';
  enipitemFilChild.orderBySQL :=  ' ENINVESTPROGRAMGROUPS.CODE ,  func_order_(ENIPITEM.ITEMNUMBER)  ,  ENIPPURPOSEPROGRAM.CODE ' ;


  ENIPItemList := TempENIPItem.getScrollableFilteredList(enipitemFilChild,0,ColCount);


  LastCount:=High(ENIPItemList.list);

  if LastCount > -1 then
     sgENIPItemChild.RowCount:=LastCount+2
  else
     sgENIPItemChild.RowCount:=2;

   with sgENIPItemChild do
    for i:=0 to LastCount do
       begin
        Application.ProcessMessages;
        if ENIPItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENIPItemList.list[i].code)
        else
        Cells[0,i+1] := '';


        Cells[1,i+1] := ENIPItemList.list[i].invGroupRefName;
        Cells[2,i+1] := ENIPItemList.list[i].itemNumber;

        // цільова програма

        Cells[3,i+1] := ENIPItemList.list[i].purposeProgramRefName;


        Cells[4,i+1] := ENIPItemList.list[i].name;
        Cells[5,i+1] := ENIPItemList.list[i].buhName;

        Cells[6,i+1] := ENIPItemList.list[i].invNumber;
        if ENIPItemList.list[i].isProjectDocument = Low(Integer) then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := IntToStr(ENIPItemList.list[i].isProjectDocument);

        Cells[8,i+1] := ENIPItemList.list[i].financing;


        if ENIPItemList.list[i].countGen = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := ENIPItemList.list[i].countGen.DecimalString;
        if ENIPItemList.list[i].price = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := ENIPItemList.list[i].price.DecimalString;
        if ENIPItemList.list[i].sumGen = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := ENIPItemList.list[i].sumGen.DecimalString;
        if ENIPItemList.list[i].quarter1count = nil then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := ENIPItemList.list[i].quarter1count.DecimalString;
        if ENIPItemList.list[i].quarter1sum = nil then
          Cells[13,i+1] := ''
        else
          Cells[13,i+1] := ENIPItemList.list[i].quarter1sum.DecimalString;
        if ENIPItemList.list[i].quarter2count = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := ENIPItemList.list[i].quarter2count.DecimalString;
        if ENIPItemList.list[i].quarter2sum = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := ENIPItemList.list[i].quarter2sum.DecimalString;
        if ENIPItemList.list[i].quarter3count = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := ENIPItemList.list[i].quarter3count.DecimalString;
        if ENIPItemList.list[i].quarter3sum = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := ENIPItemList.list[i].quarter3sum.DecimalString;
        if ENIPItemList.list[i].quarter4count = nil then
          Cells[18,i+1] := ''
        else
          Cells[18,i+1] := ENIPItemList.list[i].quarter4count.DecimalString;
        if ENIPItemList.list[i].quarter4sum = nil then
          Cells[19,i+1] := ''
        else
          Cells[19,i+1] := ENIPItemList.list[i].quarter4sum.DecimalString;

        Cells[20,i+1] := ENIPItemList.list[i].userAdd;

        if ENIPItemList.list[i].dateAdd = nil then
          Cells[21,i+1] := ''
        else
          Cells[21,i+1] := XSDateTimeWithDate2String(ENIPItemList.list[i].dateAdd);

        Cells[22,i+1] := ENIPItemList.list[i].userGen;

        if ENIPItemList.list[i].dateEdit = nil then
          Cells[23,i+1] := ''
        else
          Cells[23,i+1] := XSDateTimeWithDate2String(ENIPItemList.list[i].dateEdit);

        Cells[24,i+1] := ENIPItemList.list[i].commentGen;

        // подсветка если суммы или количество нкре не совпадают с суммами для финансирования

        if isDifferentValueNkreAndInside(ENIPItemList, i ) = True then
           sgENIPItemChild.RowColor[i + 1] := clYellow
        else
           sgENIPItemChild.RowColor[i + 1] := clWindow;

        LastRow:=i+1;
        sgENIPItemChild.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENIPItemChild.Row:=1;
end;

function TfrmENIPEdit.isDifferentValueNkreAndInside(ENIPItemList: ENIPItemShortList ; i : Integer):Boolean;
var
aa : Integer;
price, count,

countYearnkre , sumYearnkre ,
countQ1nkre, countQ2nkre, countQ3nkre, countQ4nkre,
sumQ1nkre, sumQ2nkre, sumQ3nkre, sumQ4nkre,

countYearinside , sumYearinside ,
countQ1inside, countQ2inside, countQ3inside, countQ4inside,
sumQ1inside, sumQ2inside, sumQ3inside, sumQ4inside : Double;

  nkre , inside : double;

begin

countYearnkre := 0;
sumYearnkre := 0;
countQ1nkre := 0;
countQ2nkre := 0;
countQ3nkre := 0;
countQ4nkre := 0;
sumQ1nkre := 0;
sumQ2nkre := 0;
sumQ3nkre := 0;
sumQ4nkre := 0;

countYearinside:= 0;
sumYearinside:= 0;
countQ1inside:= 0;
countQ2inside:= 0;
countQ3inside:= 0;
countQ4inside:= 0;
sumQ1inside:= 0;
sumQ2inside:= 0;
sumQ3inside:= 0;
sumQ4inside:= 0;

  nkre := 0 ;
  inside := 0;


     // кв 1 суммы кол-ва для финансирования три месяца плюсум в квартал
     try
        countQ1inside := countQ1inside + StrToFloat(ENIPItemList.list[i].mm1countInside.DecimalString);
      except
        on EConvertError do
          countQ1inside := 0;
      end;

       try
        countQ1inside := countQ1inside + StrToFloat(ENIPItemList.list[i].mm2countInside.DecimalString);
      except
        on EConvertError do
          countQ1inside := countQ1inside +  0;
      end;

      try
        countQ1inside := countQ1inside + StrToFloat(ENIPItemList.list[i].mm3countInside.DecimalString);
      except
        on EConvertError do
          countQ1inside := countQ1inside +  0;
      end;

      try
        sumQ1inside := sumQ1inside + StrToFloat(ENIPItemList.list[i].mm1sumInside.DecimalString);
      except
        on EConvertError do
          sumQ1inside := sumQ1inside +  0;
      end;

      try
        sumQ1inside := sumQ1inside + StrToFloat(ENIPItemList.list[i].mm2sumInside.DecimalString);
      except
        on EConvertError do
          sumQ1inside := sumQ1inside +  0;
      end;

      try
        sumQ1inside := sumQ1inside + StrToFloat(ENIPItemList.list[i].mm3sumInside.DecimalString);
      except
        on EConvertError do
          sumQ1inside := sumQ1inside +  0;
      end;


      //////кв 2  суммы кол-во для финансирования  три месяца плюсум в квартал
       try
        countQ2inside := countQ2inside + StrToFloat(ENIPItemList.list[i].mm4countInside.DecimalString);
      except
        on EConvertError do
          countQ2inside := countQ2inside +  0;
      end;

        try
        countQ2inside := countQ2inside + StrToFloat(ENIPItemList.list[i].mm5countInside.DecimalString);
      except
        on EConvertError do
          countQ2inside := countQ2inside +  0;
      end;

        try
        countQ2inside := countQ2inside + StrToFloat(ENIPItemList.list[i].mm6countInside.DecimalString);
      except
        on EConvertError do
          countQ2inside := countQ2inside +  0;
      end;


      try
        sumQ2inside := sumQ2inside + StrToFloat(ENIPItemList.list[i].mm4sumInside.DecimalString);
      except
        on EConvertError do
          sumQ2inside := sumQ2inside +  0;
      end;

      try
        sumQ2inside := sumQ2inside + StrToFloat(ENIPItemList.list[i].mm5sumInside.DecimalString);
      except
        on EConvertError do
          sumQ2inside := sumQ2inside +  0;
      end;

      try
        sumQ2inside := sumQ2inside + StrToFloat(ENIPItemList.list[i].mm6sumInside.DecimalString);
      except
        on EConvertError do
          sumQ2inside := sumQ2inside +  0;
      end;


      //////кв 3  суммы кол-во для финансирования  три месяца плюсум в квартал
      try
        countQ3inside := countQ3inside + StrToFloat(ENIPItemList.list[i].mm7countInside.DecimalString);
      except
        on EConvertError do
          countQ3inside := countQ3inside +  0;
      end;

      try
        countQ3inside := countQ3inside + StrToFloat(ENIPItemList.list[i].mm8countInside.DecimalString);
      except
        on EConvertError do
          countQ3inside := countQ3inside +  0;
      end;

      try
        countQ3inside := countQ3inside + StrToFloat(ENIPItemList.list[i].mm9countInside.DecimalString);
      except
        on EConvertError do
          countQ3inside := countQ3inside +  0;
      end;


      try
        sumQ3inside := sumQ3inside + StrToFloat(ENIPItemList.list[i].mm7sumInside.DecimalString);
      except
        on EConvertError do
          sumQ3inside := sumQ3inside +  0;
      end;

      try
        sumQ3inside := sumQ3inside + StrToFloat(ENIPItemList.list[i].mm8sumInside.DecimalString);
      except
        on EConvertError do
          sumQ3inside := sumQ3inside +  0;
      end;

      try
        sumQ3inside := sumQ3inside + StrToFloat(ENIPItemList.list[i].mm9sumInside.DecimalString);
      except
        on EConvertError do
          sumQ3inside := sumQ3inside +  0;
      end;

      //////кв 3  суммы кол-во для финансирования  три месяца плюсум в квартал
      try
        countQ4inside := countQ4inside + StrToFloat(ENIPItemList.list[i].mm10countInside.DecimalString);
      except
        on EConvertError do
          countQ4inside := countQ4inside +  0;
      end;

      try
        countQ4inside := countQ4inside + StrToFloat(ENIPItemList.list[i].mm11countInside.DecimalString);
      except
        on EConvertError do
          countQ4inside := countQ4inside +  0;
      end;

      try
        countQ4inside := countQ4inside + StrToFloat(ENIPItemList.list[i].mm12countInside.DecimalString);
      except
        on EConvertError do
        countQ4inside := countQ4inside +  0;
      end;

      try
        sumQ4inside := sumQ4inside + StrToFloat(ENIPItemList.list[i].mm10sumInside.DecimalString);
      except
        on EConvertError do
        sumQ4inside := sumQ4inside +  0;
      end;

      try
        sumQ4inside := sumQ4inside + StrToFloat(ENIPItemList.list[i].mm11sumInside.DecimalString);
      except
        on EConvertError do
        sumQ4inside := sumQ4inside +  0;
      end;

      try
        sumQ4inside := sumQ4inside + StrToFloat(ENIPItemList.list[i].mm12sumInside.DecimalString);
      except
        on EConvertError do
        sumQ4inside := sumQ4inside +  0;
      end;



      try
        countYearinside := countYearinside + StrToFloat(ENIPItemList.list[i].countGenInside.DecimalString);
      except
        on EConvertError do
        countYearinside := 0;
      end;

      try
        sumYearinside := sumYearinside + StrToFloat(ENIPItemList.list[i].sumGenInside.DecimalString);
      except
        on EConvertError do
        sumYearinside := 0;
      end;




      //////////// суммы и кол-во утв нкре
      ///
      try
        countYearnkre := countYearnkre + StrToFloat(ENIPItemList.list[i].countGen.DecimalString);
      except
        on EConvertError do
        countYearnkre := 0;
      end;

      try
        sumYearnkre := sumYearnkre + StrToFloat(ENIPItemList.list[i].sumGen.DecimalString);
      except
        on EConvertError do
        sumYearnkre := 0;
      end;


       try
        countQ1nkre := countQ1nkre + StrToFloat(ENIPItemList.list[i].quarter1count.DecimalString);
      except
        on EConvertError do
        countQ1nkre := 0;
      end;
       try
        countQ2nkre := countQ2nkre + StrToFloat(ENIPItemList.list[i].quarter2count.DecimalString);
      except
        on EConvertError do
        countQ2nkre := 0;
      end;
       try
        countQ3nkre := countQ3nkre + StrToFloat(ENIPItemList.list[i].quarter3count.DecimalString);
      except
        on EConvertError do
        countQ3nkre := 0;
      end;
       try
        countQ4nkre := countQ4nkre + StrToFloat(ENIPItemList.list[i].quarter4count.DecimalString);
      except
        on EConvertError do
        countQ4nkre := 0;
      end;

       try
        sumQ1nkre := sumQ1nkre + StrToFloat(ENIPItemList.list[i].quarter1sum.DecimalString);
      except
        on EConvertError do
        sumQ1nkre := 0;
      end;
      try
        sumQ2nkre := sumQ2nkre + StrToFloat(ENIPItemList.list[i].quarter2sum.DecimalString);
      except
        on EConvertError do
        sumQ2nkre := 0;
      end;
      try
        sumQ3nkre := sumQ3nkre + StrToFloat(ENIPItemList.list[i].quarter3sum.DecimalString);
      except
        on EConvertError do
        sumQ3nkre := 0;
      end;
      try
        sumQ4nkre := sumQ4nkre + StrToFloat(ENIPItemList.list[i].quarter4sum.DecimalString);
      except
        on EConvertError do
        sumQ4nkre := 0;
      end;

           inside:= countYearinside+countQ1inside+countQ2inside+countQ3inside+countQ4inside;
           nkre:= countYearnkre+countQ1nkre+countQ2nkre+countQ3nkre+countQ4nkre;

     if (
         (
           (countYearinside+countQ1inside+countQ2inside+countQ3inside+countQ4inside)
      <>   (countYearnkre+countQ1nkre+countQ2nkre+countQ3nkre+countQ4nkre)
         )
      or (
           (sumYearinside+sumQ1inside+sumQ2inside+sumQ3inside+sumQ4inside)
      <>   (sumYearnkre+sumQ1nkre+sumQ2nkre+sumQ3nkre+sumQ4nkre)
         )
      )   then
         Result:= True
         else
         Result:= False;


end;

procedure TfrmENIPEdit.N5Click(Sender: TObject);
begin
  inherited;
   frmReportIP := TfrmReportIP.Create(Application, dsInsert);
   frmReportIP.enipObjectCode:= ENIPObj.code;
   frmReportIP.inform_nkre := 1;
   frmReportIP.byIpItemParent := 0;
 try
   frmReportIP.ShowModal;
 finally
   frmReportIP.Free;

 end;
end;

procedure TfrmENIPEdit.N9ExpandByItemChildClick(Sender: TObject);
begin
  inherited;
   frmReportIP := TfrmReportIP.Create(Application, dsInsert);
   frmReportIP.enipObjectCode:= ENIPObj.code;
   frmReportIP.inform_nkre := 1;
   frmReportIP.byIpItemParent := 0; // отображает строки ИП (без групировочных строк )
 try
   frmReportIP.ShowModal;
 finally
   frmReportIP.Free;

 end;
end;

end.
